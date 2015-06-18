# -*- coding: utf-8 -*-
"""
Manage Cloudera Role Config Groups
==================================

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity:   new
:depends:    cm_api Python module
:platform:   all

Example:

.. code-block:: yaml

    zookeeper1-SERVER-BASE:
        cloudera_role_config_group.present:
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
    return 'cloudera_role_config_group' if HAS_CMAPI else False


