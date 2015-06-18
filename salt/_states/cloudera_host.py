# -*- coding: utf-8 -*-
"""
Manage Cloudera Hosts
=====================

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity:   new
:depends:    cm_api Python module
:platform:   all

Example:

.. code-block:: yaml

    host.example.com:
        cloudera_host.present:
          - cluster: Cluster 1 - CDH4
"""

# Import python libs
import logging

log = logging.getLogger(__name__)

try:
    from cm_api.api_client import ApiResource
    HAS_CMAPI = True
except ImportError:
    HAS_CMAPI = False


def __virtual__():
    """
    Only load if Cloudera Manager API is available.
    """
    return 'cloudera_host' if HAS_CMAPI else False


def present(
        name,
        address,
        cluster,
        **kwargs):
    """
    Ensures that the named host has been added to the cluster.

    name
        The name of the host to add

    address
        The address of the host to add

    cluster
        The name of the cluster on which to add the host
    """
    ret = {'changes' : {},
           'comment' : '',
           'name'    : name,
           'result'  : False}
    if __salt__['cloudera.host_exists'](name, cluster, **kwargs):
        ret['result'] = True
        ret['comment'] = 'Host {0} already present'.format(name)
        return ret
    if __opts__['test']:
        ret['result'] = None
        ret['comment'] = 'Host {0} is set to be added'.format(name)
        return ret
    if __salt__['cloudera.host_create'](name, address, cluster, **kwargs):
        ret['changes'] = {'old': '', 'new': '{0}'.format(name)}
        ret['comment'] = 'Added host {0}'.format(name)
        ret['result'] = True
        return ret
    else:
        ret['comment'] = 'Failed to add host {0}'.format(name)
        ret['result'] = False
        return ret


def absent(
        name,
        cluster,
        **kwargs):
    """
    Ensures that the named host has been removed from the cluster.

    name
        The name of the host to remove

    cluster
        The name of the cluster from which to remove the host
    """
    ret = {'changes' : {},
           'comment' : '',
           'name'    : name,
           'result'  : False}
    if not __salt__['cloudera.host_exists'](name, cluster, **kwargs):
        ret['result'] = True
        ret['comment'] = 'Host {0} already absent'.format(name)
        return ret
    if __opts__['test']:
        ret['result'] = None
        ret['comment'] = 'Host {0} is set to be removed'.format(name)
        return ret
    if __salt__['cloudera.host_remove'](name, cluster, **kwargs):
        ret['changes'] = {'old': '{0}'.format(name), 'new': ''}
        ret['comment'] = 'Removed host {0}'.format(name)
        ret['result'] = True
        return ret
    else:
        ret['comment'] = 'Failed to remove host {0}'.format(name)
        ret['result'] = False
        return ret
