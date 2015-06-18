# -*- coding: UTF-8 -*-
# pylint: disable=W0142
"""
Manage Salt Minion roles and relationships

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: all
"""

# TODO: add support for consul
# TODO: add support for etcd
# TODO: add support for mesos-dns
# TODO: add support for skydns
# TODO: add support for zookeeper
# TODO: add context sensitive set function

# import libs: compatibility
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division

# import libs: standard
import re
from ast import literal_eval
from collections import defaultdict

# import libs: salt
import salt.utils.decorators as decorators
from salt.exceptions import SaltInvocationError


__func_alias__ = {
    'dict_': 'dict',
    'list_': 'list'
}


def dict_(
        roles=None,
        minion='',
        out='ip',
        source='mine',
        saltenv=''):
    """
    Return a dictionary of roles via alternative sources
    """
    if roles is None:
        roles = []
    else:
        try:
            roles = roles.split()
        except AttributeError:
            pass

    grains = _grains(minion=minion, source=source, saltenv=saltenv)

    ret = defaultdict(list)
    if roles:
        for role in roles:
            ret[role] = []
            for minion in grains:
                if role in grains.get(minion, {}).get('roles', []):
                    ret[role] += [minion]
    else:
        for minion in grains:
            for role in grains.get(minion, {}).get('roles', []):
                ret[role] += [minion]

    if _subtype() == 'Docker' and out == 'ip':
        # ret = {role: [grains.get(minion, {}).get('fqdn_ip4')[0] \
        #              for minion in minions]
        #              for role, minions in list(ret.items())}
        ret = dict((role, [grains.get(minion, {}).get('fqdn_ip4')[0]
                           for minion in minions])
                   for (role, minions) in ret.items())

    # Allow explicitly setting roles of other minions on the command line
    #
    # Example:
    #
    # ..code-block:: bash
    #
    #   salt-call state.highstate minions="{'kube-apiserver': '127.0.0.1'}"
    #
    kwargs = dict([i.split('=', 1)[:2] for i in __opts__.get('arg', []) if '=' in i])
    if 'minions' in kwargs:
        minions = literal_eval(kwargs.get('minions'))
        if minions is not None:
            if isinstance(minions, dict):
                for key in minions.keys():
                    if key not in roles:
                        minions.pop(key, None)
                if isinstance(ret, dict):
                    ret.update(minions)
                else:
                    ret = minions
            else:
                raise SaltInvocationError(
                    'minions must be formatted as a dictionary'
                )

    return ret


def list_(
        minion='',
        source='mine',
        saltenv=''):
    """
    Return a list of roles via alternative sources
    """
    grains = _grains(minion=minion, source=source, saltenv=saltenv)

    ret = set([])
    for minion in grains:
        ret.update(grains.get(minion, {}).get('roles', []))

    return sorted(list(ret))


def order(
        minion='',
        roles=None,
        saltenv='',
        ret=None):
    """
    Return a list of roles in the order in which they should be managed
    """
    if roles is None:
        roles = list_(minion=minion, saltenv=saltenv)

    if ret is None:
        ret = []

    for role in roles:
        if ret.count(role) == 0:
            ret.append(role)
        for relation in _related_to_role(role, saltenv):
            if relation not in roles or relation == role:
                continue

            indices = [i for i, x in enumerate(ret) if x == relation]
            index = ret.index(relation) if relation in ret else len(ret)
            if ret.index(role) < index:
                if indices:
                    if not any(r in _related_to_role(relation, saltenv) for
                               r in ret[indices[0] - 1:indices[-1]]):
                        ret.pop(indices[-1])

                for index in indices[:-1]:
                    ret.pop(index)
                    if ret[index - 1] == ret[index]:
                        ret.pop(index)

                ret.insert(ret.index(role), relation)
                if not (ret.count(role) > 1 and ret.count(relation) > 1):
                    ret = order(minion=minion, roles=[relation],
                                saltenv=saltenv, ret=ret)

    return ret


def related_states(
        minion='',
        roles=None,
        saltenv=''):
    """
    Return a list of states related to minion X or roles [Y, Z]
    """
    if roles is None:
        roles = list_(minion=minion, saltenv=saltenv)

    ret = set([])
    highstate = _state_show_highstate(saltenv)
    if isinstance(highstate, dict):
        for data in list(highstate.itervalues()):
            if isinstance(data, dict):
                relation = data.get('__sls__')
                for role in roles:
                    ret.update(_states_related_to_role(role=relation,
                                                       relation=role))

    return sorted(list(ret))


def requires(
        role='',
        minion='',
        saltenv=''):
    """
    Return a list of roles required by role X
    """
    roles = list_(minion=minion, saltenv=saltenv)

    ret = set([])
    for relation in _related_to_role(role, saltenv):
        if relation in roles and relation != role:
            ret.update([relation])

    return sorted(list(ret))


def tree(
        minion='',
        trunk=None,
        roles=None,
        saltenv=''):
    """
    Return a data structure of roles and their dependencies
    """
    ret = {}

    if trunk is None:
        ret = defaultdict(dict)
    else:
        ret.update(trunk)

    if roles is None:
        roles = list_(minion=minion, saltenv=saltenv)

    for role in roles:
        relations = _related_to_role(role, saltenv)
        _tree = tree(trunk=ret, roles=[r for r in relations if r != role])
        # ret[role] = {k: v for (k, v) in list(_tree.items()) if k not in ret}
        ret[role] = dict((k, v) for (k, v) in _tree.items() if k not in ret)

    return ret


@decorators.memoize
def _cp_list_states(
        *args):
    """
    Get list of states on salt-master
    """
    args = list(args)

    if args[0]:
        saltenv = args[0]
    else:
        saltenv = _environment()

    return __salt__['cp.list_states'](saltenv=saltenv)


@decorators.memoize
def _environment():
    """
    Get environment
    """
    return __salt__['grains.get']('environment', default='base')


def _grains(
        minion='',
        source='mine',
        saltenv=''):
    """
    Return a list of roles via alternative sources
    """
    client = __salt__['config.get']('file_client')

    if client == 'local':
        return _grains_via_grains()
    if source == 'mine':
        return _grains_via_mine(minion=minion, saltenv=saltenv)
    elif source == 'peer':
        return _grains_via_peer(minion=minion, saltenv=saltenv)
    else:
        pass


def _grains_via_grains():
    """
    Return a dictionary of grains via grains
    """
    roles = __salt__['environ.get']('roles')

    ret = {'localhost': __salt__['grains.items']()}

    if not ret['localhost'].get('roles') and roles:
        ret['localhost']['roles'] = roles.split(',')

    return ret


def _grains_via_mine(
        minion='',
        saltenv=''):
    """
    Return a dictionary of grains via mine
    """
    if minion:
        ret = _grains_via_mine_on_minion(minion)
    elif saltenv == 'all':
        ret = _grains_via_mine_on_minion('*')
    else:
        ret = _grains_via_mine_in_env(saltenv)

    return ret


@decorators.memoize
def _grains_via_mine_in_env(
        *args):
    """
    Return a dictionary of grains via mine in env X
    """
    args = list(args)
    kwargs = {}

    if args[0]:
        args[0] = 'environment:' + args[0]
    else:
        args[0] = 'environment:' + _environment()

    args.append('grains.item')

    kwargs['expr_form'] = 'grain'

    ret = __salt__['mine.get'](*args, **kwargs)

    return ret


@decorators.memoize
def _grains_via_mine_on_minion(
        *args):
    """
    Return a dictionary of grains via mine on minion X
    """
    args = list(args)
    ret = {}

    if args[0]:
        args.append('grains.item')

        ret = __salt__['mine.get'](*args)

    return ret


def _grains_via_peer(
        minion='',
        saltenv=''):
    """
    Return a dictionary of grains via peer communication
    """
    if minion:
        ret = _grains_via_peer_on_minion(minion)
    elif saltenv == 'all':
        ret = _grains_via_peer_on_minion('*')
    else:
        ret = _grains_via_peer_in_env(saltenv)

    return ret


@decorators.memoize
def _grains_via_peer_in_env(
        *args):
    """
    Return a dictionary of grains via peer communication in env X
    """
    args = list(args)
    kwargs = {}

    if args[0]:
        args[0] = 'environment:' + args[0]
    else:
        args[0] = 'environment:' + _environment()

    args.append('grains.item')
    args.append('roles')

    kwargs['expr_form'] = 'grain'

    ret = __salt__['publish.publish'](*args, **kwargs)

    return ret


@decorators.memoize
def _grains_via_peer_on_minion(
        *args):
    """
    Return a dictionary of grains via peer communication on minion X
    """
    args = list(args)
    ret = {}

    if args[0]:
        args.append('grains.item')
        args.append('roles')

        ret = __salt__['publish.publish'](*args)

    return ret


@decorators.memoize
def _related_to_role(
        *args):
    """
    Return a list of roles related to role X
    """
    args = list(args)

    if args[0]:
        role = args.pop(0)
    else:
        return []

    if args[0]:
        saltenv = args.pop(0)
    else:
        saltenv = _environment()

    ret = [s.replace(role + '.relate-', '')
           for s in _states_related_to_role(role=role, saltenv=saltenv)]

    return sorted(ret)


@decorators.memoize
def _state_show_highstate(
        *args):
    """
    Get data structure of highstate, including subordinate states
    """
    args = list(args)

    if args[0]:
        saltenv = args[0]
    else:
        saltenv = _environment()

    return __salt__['state.show_highstate'](pillar={'subordinate': True},
                                            saltenv=saltenv)


@decorators.memoize
def _states(
        *args):
    """
    Return a list of states
    """
    args = list(args)

    if args[0]:
        pattern = args.pop(0)
    else:
        pattern = r'.*'

    if args[0]:
        saltenv = args.pop(0)
    else:
        saltenv = _environment()

    grammar = re.compile(pattern)

    ret = set([])
    for state in _cp_list_states(saltenv):
        if grammar.match(state):
            ret.update([state])

    return sorted(list(ret))


def _states_related_to_role(
        role='',
        relation='.*',
        saltenv=''):
    """
    Return a list of states related to state X
    """
    ret = set([])
    if role:
        pattern = role + '\\.relate-' + relation

        for state in _states(pattern, saltenv):
            ret.update([state])

    return sorted(list(ret))


def _subtype():
    """
    Get virtual subtype
    """
    return __salt__['grains.get']('virtual_subtype')
