# -*- coding: utf-8 -*-
"""
Manage Cloudera

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: all

:depends: - cloudera-cm4-api
          - cloudera-cm5-api
"""

# import libs: standard
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division
from builtins import dict
from future import standard_library
standard_library.install_aliases()
from logging import getLogger
from time import sleep

try:
    from cm_api.api_client import ApiException, ApiResource
    from cm_api.endpoints.clusters import ApiCluster
    from cm_api.endpoints.hosts import ApiHost
    from cm_api.endpoints.parcels import ApiParcel
    from cm_api.endpoints.role_config_groups import ApiRoleConfigGroup
    from cm_api.endpoints.roles import ApiRole
    from cm_api.endpoints.services import ApiService
    from cm_api.endpoints.types import *
    HAS_LIBS = True
except ImportError:
    HAS_LIBS = False

CMD_TIMEOUT = 360

log = getLogger(__name__)


def __virtual__():
    """
    Only load if Cloudera Manager API is available.
    """
    return 'cloudera' if HAS_LIBS else False


def _connect(**kwargs):
    """
    wrap authentication credentials here
    """
    connargs = dict()

    def _connarg(name, key=None):
        """
        Add key to connargs, only if name exists in our kwargs or as
        cloudera:<key> in __opts__ or __pillar__ Evaluate in said order -
        kwargs, opts then pillar. To avoid collision with other functions,
        kwargs-based connection arguments are prefixed with 'cm_' (i.e.
        'cm_host', 'cm_user', etc.).
        """
        if key is None:
            key = name
        if name in kwargs:
            connargs[key] = kwargs[name]
        else:
            prefix = 'cm_'
            if name.startswith(prefix):
                try:
                    name = name[len(prefix):]
                except IndexError:
                    return
            val = __salt__['config.get']('cloudera:{0}'.format(key), None)
            if val is not None:
                connargs[key] = val

    _connarg('cm_user', 'username')
    _connarg('cm_pass', 'password')

    try:
        a = ApiResource(__salt__['roles.dict']('cloudera-cm4-server')['cloudera-cm4-server'][0],
                          **connargs)
    except ApiException as e:
        err = '{0}'.format(*e)
        log.error(err)
        return None

    return a


def cluster_exists(name, **cm_args):
    """
    Checks if a cluster exists in Cloudera Manager.

    name
        The name of the cluster to check

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.cluster_exists 'Cluster 1 - CDH4'
    """
    a = _connect(**cm_args)
    if a is None:
        return False
    try:
        c = a.get_cluster(name)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False
    return True


def cluster_create(name, version, **cm_args):
    """
    Creates a cluster in Cloudera Manager.

    name
        The name of the cluster to create (recommended: Cluster 1 - CDH4)

    version
        The version of the cluster to create (recommended: CDH4)

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.cluster_create 'Cluster 1 - CDH4' 'CDH4'
    """
    if cluster_exists(name, **cm_args):
        log.info('{0!r} already exists'.format(name))
        return False

    a = _connect(**cm_args)
    if a is None:
        return False

    try:
        c = a.create_cluster(name, version)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    if cluster_exists(name, **cm_args):
        log.info('{0!r} created'.format(name))
        return True
    else:
        return False


def cluster_remove(name, **cm_args):
    """
    Removes a cluster from Cloudera Manager.

    name
        The name of the cluster to remove

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.cluster_remove 'Cluster 1 - CDH4'
    """
    if not cluster_exists(name, **cm_args):
        log.error('{0!r} does not exist'.format(name))
        return False

    a = _connect(**cm_args)
    if a is None:
        return False
    try:
        c = a.delete_cluster(name)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    if not cluster_exists(name, **cm_args):
        log.info('{0!r} removed'.format(name))
        return True
    else:
        return False


def host_exists(name, cluster, **cm_args):
    """
    Checks if a host exists in the named cluster.

    name
        The name of the host to check

    cluster
        The name of the cluster on which to check for the host

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.host_exists 'host.example.com' 'Cluster 1 - CDH4'
    """
    a = _connect(**cm_args)
    if a is None:
        return False
    try:
        c = a.get_cluster(cluster)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False

    try:
        hosts = c.list_hosts()
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False

    if any(h.hostId == name for h in hosts):
        return True
    else:
        return False


def host_create(name, address, cluster, **cm_args):
    """
    Adds a host to a cluster

    name
        The name of the host to add

    address
        The address of the host to add

    cluster
        The name of the cluster on which to add the host

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.host_create 'host.example.com'                       \
                                      '192.168.0.1'                            \
                                      'Cluster 1 - CDH4'
    """
    if host_exists(name, cluster, **cm_args):
        log.info('Host {0!r} already exists'.format(name))
        return False

    a = _connect(**cm_args)
    if a is None:
        return False

    try:
        hosts = a.get_all_hosts()
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    if not any(h.hostId == name for h in hosts):
        try:
            log.info('Creating host {0}'.format(name))
            a.create_host(name, name, address)
        except ApiException as e:
            err = '{0}'.format(e._message)
            log.error(err)
        else:
            log.debug('Created host {0}'.format(name))

    try:
        c = a.get_cluster(cluster)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    try:
        c.add_hosts([name])
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    if host_exists(name, cluster, **cm_args):
        log.info('Host {0!r} added'.format(name))
        return True
    else:
        return False


def host_remove(name, cluster, **cm_args):
    """
    Removes a host from a cluster.

    name
        The name of the host to remove

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.host_remove 'host.example.com' 'Cluster 1 - CDH4'
    """
    if not host_exists(name, cluster, **cm_args):
        log.error('Host {0!r} does not exist'.format(name))
        return False

    a = _connect(**cm_args)
    if a is None:
        return False

    try:
        hosts = a.get_all_hosts()
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    try:
        c = a.get_cluster(cluster)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    try:
        c.remove_host(name)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    if any(h.hostId == name for h in hosts):
        try:
            log.info('Removing host {0}'.format(name))
            a.delete_host(name, name, address)
        except ApiException as e:
            err = '{0}'.format(e._message)
            log.error(err)
        else:
            log.debug('Removed host {0}'.format(name))

    if not host_exists(name, cluster, **cm_args):
        log.info('Host {0!r} removed'.format(name))
        return True
    else:
        return False


def parcel_is_installed(name, version, cluster, **cm_args):
    """
    Checks whether a parcel has been installed on a cluster.

    name
        The name of the product to check

    version
        The version of the product to check

    cluster
        The name of the cluster on which to check the product

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.parcel_is_installed 'CDH'                            \
                                              '4.5.0-1.cdh4.5.0.p0.30'         \
                                              'Cluster 1 - CDH4'
    """
    a = _connect(**cm_args)
    if a is None:
        return False
    try:
        c = a.get_cluster(cluster)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False

    try:
        p = c.get_parcel(name, version)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False

    if p.stage == 'ACTIVATED':
        return True
    else:
        return False


def parcel_install(name, version, cluster, **cm_args):
    """
    Installs a parcel on a cluster.

    name
        The name of the product to install

    version
        The version of the product to install

    cluster
        The name of the cluster on which to install the product

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.parcel_install 'CDH'                                 \
                                         '4.5.0-1.cdh4.5.0.p0.30'              \
                                         'Cluster 1 - CDH4'
    """
    if parcel_is_installed(name, version, cluster, **cm_args):
        log.info('{0}-{1} already installed'.format(name, version))
        return False

    a = _connect(**cm_args)
    if a is None:
        return False
    try:
        c = a.get_cluster(cluster)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False

    try:
        p = c.get_parcel(name, version)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False

    while (p.stage == 'UNAVAILABLE'):
        p = c.get_parcel(name, version)
        sleep(1)

    if p.stage == 'AVAILABLE_REMOTELY':

        try:
            log.info('Downloading parcel {0}-{1}'.format(name, version))
            cmd = p.start_download()
        except ApiException as e:
            err = '{0}'.format(e._message)
            log.error(err)
        else:
            while (p.stage == 'AVAILABLE_REMOTELY' or
                   p.stage == 'DOWNLOADING'):
                p = c.get_parcel(name, version)
                sleep(1)

            log.info('Downloaded parcel {0}-{1}'.format(name, version))

    if p.stage == 'DOWNLOADED':

        try:
            log.info('Distributing parcel {0}-{1}'.format(name, version))
            cmd = p.start_distribution()
        except ApiException as e:
            err = '{0}'.format(e._message)
            log.error(err)
        else:
            while (p.stage == 'DOWNLOADED' or
                   p.stage == 'DISTRIBUTING'):
                p = c.get_parcel(name, version)
                sleep(1)

            log.info('Distributed parcel {0}-{1}'.format(name, version))

    if p.stage == 'DISTRIBUTED':

        try:
            log.info('Activating parcel {0}-{1}'.format(name, version))
            cmd = p.activate()
        except ApiException as e:
            err = '{0}'.format(e._message)
            log.error(err)
        else:
            if not cmd.wait(CMD_TIMEOUT).success:
                log.error('Timeout activating parcel {0}-{1}'.format(name, version))
            else:
                log.info('Activated parcel {0}-{1}'.format(name, version))

    if parcel_is_installed(name, version, cluster, **cm_args):
        log.info('{0}-{1} installed'.format(name, version))
        return True


def parcel_remove(name, version, cluster, **cm_args):
    """
    Removes a parcel from a cluster.

    name
        The name of the product to remove

    version
        The version of the product to remove

    cluster
        The name of the cluster from which to remove the product

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.parcel_remove 'CDH'                                  \
                                        '4.5.0-1.cdh4.5.0.p0.30'               \
                                        'Cluster 1 - CDH4'
    """


def service_exists(name, cluster, **cm_args):
    """
    Checks if a service exists in the named cluster.

    name
        The name of the service to check

    cluster
        The name of the cluster on which to check for the service

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.service_exists 'hdfs1' 'Cluster 1 - CDH4'
    """
    a = _connect(**cm_args)
    if a is None:
        return False
    try:
        c = a.get_cluster(cluster)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False

    try:
        services = c.get_all_services()
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False

    if any(s.name == name for s in services):
        return True
    else:
        return False


def service_create(name, cluster, **cm_args):
    """
    Adds a service to a cluster

    name
        The name of the service to add

    cluster
        The name of the cluster on which to add the service

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.service_create 'hdfs1' 'Cluster 1 - CDH4'
    """
    for m in re.finditer('^(hbase|hdfs|zookeeper)(\d+)$', name):
        service_type = m.group(1).upper()

    if service_exists(name, cluster, **cm_args):
        log.info('service {0!r} already exists'.format(name))
        return False

    a = _connect(**cm_args)
    if a is None:
        return False

    try:
        c = a.get_cluster(cluster)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    try:
        c.create_service(name, service_type)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    if service_exists(name, cluster, **cm_args):
        log.info('service {0!r} added'.format(name))
        return True
    else:
        return False


def service_remove(name, **cm_args):
    """
    Removes a service from a cluster.

    name
        The name of the service to remove

    CLI Example:

    .. code-block:: bash

        salt '*' cloudera.service_remove 'hdfs1' 'Cluster 1 - CDH4'
    """
    service_types=['HBASE', 'HDFS', 'ZOOKEEPER']

    if not service_exists(name, cluster, **cm_args):
        log.error('Service {0!r} does not exist'.format(name))
        return False

    a = _connect(**cm_args)
    if a is None:
        return False

    try:
        c = a.get_cluster(cluster)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    try:
        c.delete_service(name)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)

    if not service_exists(name, cluster, **cm_args):
        log.info('Service {0!r} removed'.format(name))
        return True
    else:
        return False

def role_exists(role_name,  hostname, service_name, cluster, **cm_args):
    a = _connect(**cm_args)
    if a is None:
        return False
    try:
        c = a.get_cluster(cluster)
        s = c.get_service(service_name)
        roles = s.get_all_roles()
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False

    if any(r.name == role_name for r in roles):
        return True
    else:
        return False

def role_create(role_name, role_type, hostname, service_name, cluster, **cm_args):

    if role_exists(role_name, hostname, service_name, cluster, **cm_args):
        log.info('Role {0!r} already exists'.format(role_name))
        return False

    a = _connect(**cm_args)
    if a is None:
        return False
    try:
        c = a.get_cluster(cluster)
        s = c.get_service(service_name)

        hosts = [a.get_host(host.hostId) for host in c.list_hosts()]
        host = [host for host in hosts if host.hostname == hostname][0]

    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False

    try:
        s.create_role(role_name,role_type,host.hostId)
    except ApiException as e:
        err = '{0}'.format(e._message)
        log.error(err)
        return False

    if role_exists(role_name, hostname, service_name, cluster, **cm_args):
        log.info('Role {0!r} added'.format(role_name))
        return True
    else:
        return False
