# -*- coding: UTF-8 -*-
'''
Manage minion roles
'''

import logging
import salt.payload
import salt.utils
import sys

log = logging.getLogger(__name__)


def _get_roles(env='',
               minion='',
               source='mine'):
    '''
    Get grains
    '''
    if not env:
        env = __salt__['grains.get']('environment')

    if not minion:
        minion = '*'

    if source == 'mine':
        if env == 'all':
            ret = __salt__['mine.get'](minion, 'grains.item')
        else:
            ret = __salt__['mine.get']('environment:' + env,
                                       'grains.item',
                                       expr_form='grain')
    elif source == 'peer':
        if env == 'all':
            ret = __salt__['publish.publish'](minion, 'grains.item', 'roles')
        else:
            ret = __salt__['publish.publish']('environment:' + env,
                                              'grains.item',
                                              'roles',
                                              expr_form='grain')
    else:
        sys.exit(1)

    return ret


def list_minions(roles,
                 default=None,
                 env='',
                 out='ip',
                 source='mine'):
    '''
    Get minions to which specified role is assigned
    '''
    if default is None:
        default = []

    ret = {}
    data = _get_roles(env=env, source=source)
    subtype = __salt__['config.get']('virtual_subtype')
    roles_ = []

    try:
        for role in roles.split():
            roles_.append(role)
    except AttributeError:
        for role in roles:
            roles_.append(role)

    for role in roles_:
        ret[role] = []
        for minion, grains in data.iteritems():
            if 'roles' in grains and role in grains.get('roles'):
                if out == 'ip' and subtype == 'Docker':
                    ret[role].append(grains.get('fqdn_ip4')[0])
                else:
                    ret[role].append(minion)

    if ret:
        return ret
    else:
        return default


def list_related_states(minion='',
                        roles=None):
    '''
    Get related states of a minion or roles
    '''
    env = __salt__['grains.get']('environment')

    if roles is None:
        roles = []
        data = _get_roles(env=env,
                          minion=minion,
                          source='mine')

        for minion, grains in data.iteritems():
            for role in grains.get('roles'):
                if role not in roles:
                    roles.append(role)

    highstate = __salt__['state.show_highstate'](pillar={'subordinate': True})
    states = __salt__['cp.list_states'](saltenv=env)
    ret = []

    if isinstance(highstate, dict):
        for data in highstate.values():
            if isinstance(data, dict):
                sls = data.get('__sls__')
                for role in roles:
                    state = sls + '.relate-' + role
                    if state in states and state not in ret:
                        ret.append(state)

    return sorted(ret)
