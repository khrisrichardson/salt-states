# -*- coding: utf-8 -*-
"""
Manage sensu

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: linux
"""

# TODO: install */relate-sensu-api.sls if missing

# import libs: standard
from collections import defaultdict
from glob import glob
from json import load
from subprocess import call


def check(role=None, name=None):
    """
    """
    results = defaultdict(int)
    for (key, args) in list_commands(role=role):
        if name is None or name == key:
            results[key] = call(args)
    if results:
        ret = all(v == 0 for v in results.values())
    else:
        ret = False
    return ret


def list_checks(role=None):
    """
    """
    if role is None:
        role = '*'
    else:
        if role in __salt__['config.get']('roles'):
            __salt__['state.sls'](role + '.relate-sensu-api',
                                  pillar={'test': True})
    return _list_values(key='checks', pattern='checks-' + role)


def list_clients():
    """
    """
    return _list_values(key='clients')


def list_commands(role=None, handler='default'):
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


def _list_values(key=None, pattern='*'):
    """
    """
    ret = []
    paths = glob('/etc/sensu/conf.d/' + pattern + '.json')
    for path in paths:
        with open(path) as path:
            val = load(path).get(key)
            if isinstance(val, dict):
                ret += val.items()
            else:
                ret += [val] if val is not None else []
    return ret
