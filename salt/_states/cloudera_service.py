# -*- coding: utf-8 -*-
"""
Manage Cloudera Services
========================

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity:   new
:depends:    cm_api Python module
:platform:   all

Example:

.. code-block:: yaml

    zookeeper1:
        cloudera_service.present:
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
    return 'cloudera_service' if HAS_CMAPI else False


def present(
        name,
        cluster,
        **kwargs):
    """
    Ensures that the named service has been added to the cluster.

    name
        The name of the service to add

    cluster
        The name of the cluster on which to add the service
    """
    ret = {'changes' : {},
           'comment' : '',
           'name'    : name,
           'result'  : False}
    if __salt__['cloudera.service_exists'](name, cluster, **kwargs):
        ret['result'] = True
        ret['comment'] = 'Host {0} already present'.format(name)
        return ret
    if __opts__['test']:
        ret['result'] = None
        ret['comment'] = 'Host {0} is set to be added'.format(name)
        return ret
    if __salt__['cloudera.service_create'](name, cluster, **kwargs):
        ret['changes'] = {'old': '', 'new': '{0}'.format(name)}
        ret['comment'] = 'Added service {0}'.format(name)
        ret['result'] = True
        return ret
    else:
        ret['comment'] = 'Failed to add service {0}'.format(name)
        ret['result'] = False
        return ret


def absent(
        name,
        cluster,
        **kwargs):
    """
    Ensures that the named service has been removed from the cluster.

    name
        The name of the service to remove

    cluster
        The name of the cluster from which to remove the service
    """
    ret = {'changes' : {},
           'comment' : '',
           'name'    : name,
           'result'  : False}
    if not __salt__['cloudera.service_exists'](name, cluster, **kwargs):
        ret['result'] = True
        ret['comment'] = 'Host {0} already absent'.format(name)
        return ret
    if __opts__['test']:
        ret['result'] = None
        ret['comment'] = 'Host {0} is set to be removed'.format(name)
        return ret
    if __salt__['cloudera.service_remove'](name, cluster, **kwargs):
        ret['changes'] = {'old': '{0}'.format(name), 'new': ''}
        ret['comment'] = 'Removed service {0}'.format(name)
        ret['result'] = True
        return ret
    else:
        ret['comment'] = 'Failed to remove service {0}'.format(name)
        ret['result'] = False
        return ret
