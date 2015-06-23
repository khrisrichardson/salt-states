# -*- coding: utf-8 -*-
'''
Manage Cloudera Services
========================

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity:   new
:depends:    cm_api Python module
:platform:   all

Example:

.. code-block:: yaml

    HDFS1-NAMENODE-BASE:
        cloudera_role_group.configure:
          - cluster: Cluster 1 - CDH5
          - config:
            - dfs_replication: 1
'''

import logging

log = logging.getLogger(__name__)

try:
    from cm_api.api_client import ApiResource
    HAS_CMAPI = True
except ImportError:
    HAS_CMAPI = False


def __virtual__():
    '''
    Only load if Cloudera Manager API is available.
    '''
    return 'cloudera_role_group' if HAS_CMAPI else False

def configure(name, config, cluster, **cm_args):
    '''
    Ensures that the role group is properly configured
    
    '''
    ret = {'changes' : {},
           'comment' : '',
           'name'    : name,
           'result'  : False}
    old_conf = __salt__['cloudera.role_config_group_get_configuration'](name, cluster, **cm_args)
    if old_conf is not None and all(item in old_conf.items() for item in config.items()):
        ret['result'] = True
        ret['comment'] = 'Role configuration group {0} already configured'.format(name)
        return ret
    if __salt__['cloudera.role_config_group_configure'](name, config, cluster, **cm_args):
        ret['result'] = True
        ret['comment'] = 'Role configuration group {0} configured.'
        ret['changes'] = dict( (item, {'old': old_conf.get(item,''), 'new': config[item] }) for item in config.keys() if config[item] != old_conf.get(item,None) )
        return ret
    else:
        ret['result'] = False
        ret['comment'] = 'Failed to configure role configuration group {0}'.format(name)
        return ret