# -*- coding: utf-8 -*-
"""
Manage Sensu

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: linux

:depends: - sensu-client
"""

# import libs: standard
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division
from collections import defaultdict
from glob import glob
from json import load
from subprocess import call


def check(
        role=None,
        name=None):
    """
    """
    results = defaultdict(int)
    for (key, args) in list_commands(role=role):
        if name is None or name == key:
            results[key] = call(' '.join(args), shell=True)
    if results:
        ret = all(v == 0 for v in list(results.itervalues()))
    else:
        ret = False
    return ret


def list_checks(
        role=None):
    """
    """
    ret = []

    if role is None:
        roles = _list_roles()
    else:
        roles = [role]

    for role in roles:
        path = '/etc/sensu/conf.d/checks-' + role + '.json'
        if role in _list_roles() \
                and not __salt__['file.file_exists'](path):
            __salt__['state.sls'](role)
            __salt__['state.sls'](role + '.relate-sensu-api',
                                  pillar={'test': True})
        ret += _list_values(key='checks', pattern='checks-' + role)
    return ret


def list_clients():
    """
    """
    return _list_values(key='clients')


def list_commands(
        role=None,
        handler='default'):
    """
    """
    ret = []
    for (name, val) in list_checks(role=role):
        handlers = val.get('handlers', [])
        if handler in handlers:
            command = val.get('command', '').split()
            if command[0].split('.')[-1] == 'rb':
                command = [u'/opt/sensu/embedded/bin/ruby'] + command
            ret += [(name, command)]
    return ret


def list_handlers():
    """
    """
    return _list_values(key='handlers')


def list_mutators():
    """
    """
    return _list_values(key='mutators')


def _list_values(
        key=None,
        pattern='*'):
    """
    """
    ret = []
    paths = glob('/etc/sensu/conf.d/' + pattern + '.json')
    for path in paths:
        with open(path) as json:
            val = load(json).get(key)
            if isinstance(val, dict):
                ret += list(val.items())
            else:
                ret += [val] if val is not None else []
    return ret


def _list_roles():
    """
    """
    return set([r for r in list(__salt__['config.get']('roles')) +
                __salt__['environ.get']('roles').split(',') if r])
