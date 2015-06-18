# -*- coding: utf-8 -*-
"""
Manage Cloudera Clusters
========================

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity:   new
:depends:    cm_api Python module
:platform:   all

Example:

.. code-block:: yaml

    Cluster 1 - CDH4:
        cloudera_cluster.present: []
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
    return 'cloudera_cluster' if HAS_CMAPI else False


def present(
        name,
        version,
        **kwargs):
    """
    Ensures that the named Cloudera cluster is present.

    name
        The name of the cluster to create (recommended: Cluster 1 - CDH4)

    version
        The version of the cluster to create (recommended: CDH4)
    """
    ret = {'changes' : {},
           'comment' : '',
           'name'    : name,
           'result'  : False}
    if __salt__['cloudera.cluster_exists'](name, **kwargs):
        ret['result'] = True
        ret['comment'] = '{0} already present'.format(name)
        return ret
    if __opts__['test']:
        ret['result'] = None
        ret['comment'] = '{0} is set to be created'.format(name)
        return ret
    if __salt__['cloudera.cluster_create'](name, version, **kwargs):
        ret['changes'] = {'old': '', 'new': '{0}'.format(name)}
        ret['comment'] = 'Created {0}'.format(name)
        ret['result'] = True
        return ret
    else:
        ret['comment'] = 'Failed to create {0}'.format(name)
        ret['result'] = False
        return ret


def absent(
        name,
        **kwargs):
    """
    Ensures that the named Cloudera cluster is absent.

    name
        The name of the cluster to remove
    """
    ret = {'changes' : {},
           'comment' : '',
           'name'    : name,
           'result'  : False}
    if not __salt__['cloudera.cluster_exists'](name, **kwargs):
        ret['result'] = True
        ret['comment'] = '{0} already absent'.format(name)
        return ret
    if __opts__['test']:
        ret['result'] = None
        ret['comment'] = '{0} is set to be removed'.format(name)
        return ret
    if __salt__['cloudera.cluster_remove'](name, **kwargs):
        ret['changes'] = {'old': '{0}'.format(name), 'new': ''}
        ret['comment'] = 'Removed {0}'.format(name)
        ret['result'] = True
        return ret
    else:
        ret['comment'] = 'Failed to remove {0}'.format(name)
        ret['result'] = False
        return ret
