# -*- coding: utf-8 -*-
"""
Manage Cloudera Roles
=====================

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity:   new
:depends:    cm_api Python module
:platform:   all

Example:

.. code-block:: yaml

    zookeeper1-SERVER-421aa90e079fa326b6494f812ad13e79:
        cloudera_role.present:
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
    return 'cloudera_role' if HAS_CMAPI else False


def present(role_name, role_type, hostname, service_name,  cluster, **cm_args):
    '''
    Ensures that the named role has been added to the cluster.

    role_name
        The name of the role to add

    role_type
        The type of the role to add

    service_name
        The name of the service to which the role belongs

    hostname
        the name of the host to which the role is going to be assigned

    cluster
        The name of the cluster on which to add the role
    '''
    ret = {'changes' : {},
           'comment' : '',
           'name'    : name,
           'result'  : False}
    if __salt__['cloudera.role_exists'](role_name, hostname, service_name, cluster, **cm_args):
        ret['result'] = True
        ret['comment'] = 'Role {0} already present'.format(role_name)
        return ret
    if __opts__['test']:
        ret['result'] = None
        ret['comment'] = 'Role {0} is set to be added'.format(role_name)
        return ret
    if __salt__['cloudera.role_create'](role_name, role_type, hostname, service_name, cluster, **cm_args):
        ret['changes'] = {'old': '', 'new': '{0}'.format(role_name)}
        ret['comment'] = 'Added role {0}'.format(role_name)
        ret['result'] = True
        return ret
    else:
        ret['comment'] = 'Failed to add role {0}'.format(role_name)
        ret['result'] = False
        return ret
