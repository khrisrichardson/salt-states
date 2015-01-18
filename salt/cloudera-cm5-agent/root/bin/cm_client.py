#!/usr/bin/env python
'''
Cloudera setup
'''

import hashlib
import httplib
import logging
import os
import re
import sys
import time

from ConfigParser import ConfigParser
from cm_api.api_client import ApiException, ApiResource
from cm_api.endpoints.clusters import ApiCluster
from cm_api.endpoints.hosts import ApiHost
from cm_api.endpoints.parcels import ApiParcel
from cm_api.endpoints.role_config_groups import ApiRoleConfigGroup
from cm_api.endpoints.roles import ApiRole
from cm_api.endpoints.services import ApiService
from cm_api.endpoints.types import *
from datetime import datetime
from itertools import chain
from salt.client import Caller
from urllib2 import URLError


CMD_TIMEOUT = 360

format = '%(asctime)s %(levelname)-9s %(name)-30s %(message)s'

logging.basicConfig(format=format, level=logging.INFO)

ch = logging.StreamHandler()
ch.setFormatter(logging.Formatter(format))
ch.setLevel(logging.DEBUG)

logger = logging.getLogger('cm_client')
logger.addHandler(ch)

role_map = {
    'CLOUDERA-MANAGER'      : {
        'SERVER'            : 'cloudera-cm5-server',
    },
    'HBASE'                 : {
        'MASTER'            : 'hbase-master',
        'REGIONSERVER'      : 'hbase-regionserver',
    },
    'HDFS'                  : {
        'DATANODE'          : 'hadoop-hdfs-datanode',
        'JOURNALNODE'       : 'hadoop-hdfs-journalnode',
        'NAMENODE'          : 'hadoop-hdfs-namenode',
        'SECONDARYNAMENODE' : 'hadoop-hdfs-secondarynamenode',
    },
    'ZOOKEEPER'             : {
        'SERVER'            : 'zookeeper-server',
    },
}


class ClouderaManagerClient(ApiResource):
    '''
    Resource object that provides methods for managing the top-level API
    resources.
    '''
    def __init__(self,
                 hostname=None,
                 port='7180',
                 username='admin',
                 password='admin'):
        '''
        Creates a Resource object that provides API endpoints.

        @param hostname: Hostname of the Cloudera Manager server.
        @param port:     Port of the server. Defaults to 7180 (http).
        @param username: Login name.
        @param password: Login password.
        '''
        config = Config()
        salt   = Salt()

        if hostname is None:
            hostname = salt.function('roles.dict', 'cloudera-cm5-server')['cloudera-cm5-server'][0]

        try:
            logger.debug('Acquiring Cloudera Manager API resource')
            ApiResource.__init__(self, hostname, port, username, password)
        except ApiException:
            logger.error('Problem acquiring Cloudera Manager API resource')
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', hostname)
            sys.exit(1)
        else:
            self.config = config
            self.salt   = salt

            cluster = ClouderaManagerCluster(self)
            host    = ClouderaManagerHost(self)


class ClouderaManagerCluster(ApiCluster):
    '''
    Cloudera Manager cluster object that provides access to hosts, parcels, and
    services.
    '''
    _ATTRIBUTES = {
      'client'            : None,
      'name'              : None,
      'version'           : None,
      'maintenanceMode'   : ROAttr(),
      'maintenanceOwners' : ROAttr(),
    }

    #---------------------------------------------------------------------------
    # TODO: enter maintenance mode
    #---------------------------------------------------------------------------

    def __init__(self,
                 client,
                 name=None,
                 version='CDH5',
                 instance=None):
        '''
        Get or create a Cloudera Manager cluster object.
        '''
        self.client = client

        clusters = client.get_all_clusters()
        config   = client.config
        salt     = client.salt

        if name is None:
            if instance is None:
                instance = config.get('DEFAULT', 'instance')
            name = 'Cluster ' + instance + ' - ' + version

        if not any(c.name == name for c in clusters):
            cluster = self._create(name, version)
        else:
            cluster = self._get(name)

        self.__dict__.update(cluster.__dict__)

        host = ClusterHost(self)

        self._get_parcels()
        self._create_services()
        self._deploy_client_config()


    def _create(self, name, version='CDH5'):
        '''
        Create a new cluster.

        @param name:    Cluster name
        @param version: Cluster CDH version
        @return:        An ApiCluster object
        '''
        client = self.client

        try:
            logger.info('Creating %s', name)
            cluster = client.create_cluster(name, version)
        except ApiException:
            logger.error('Problem creating %s', name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            return cluster


    def _get(self, name):
        '''
        Look up a cluster by name.

        @param name: Cluster name
        @return:     An ApiCluster object
        '''
        client = self.client

        try:
            logger.debug('Getting %s', name)
            cluster = client.get_cluster(name)
        except ApiException:
            logger.error('Problem getting %s', name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            return cluster


    def _get_parcels(self):
        '''
        Manages all parcels
        '''
        parcels = [
            {
                'product': 'CDH',
                'version': '5.0.1-1.cdh5.0.1.p0.47'
            },
            {
                'product': 'SOLR',
                'version': '1.2.0-1.cdh4.5.0.p0.4'
            }
        ]
        #-----------------------------------------------------------------------
        # TODO: make this conditional on roles
        #-----------------------------------------------------------------------
        for parcel in parcels:
            product = parcel['product']
            version = parcel['version']
            parcel  = ClusterParcel(self, product, version)


    def _create_services(self, hostname=None):
        '''
        Manages services
        '''
        zookeeper = ClusterZookeeper(self)
        hdfs      = ClusterHDFS(self)
        hbase     = ClusterHBase(self)


    def _deploy_client_config(self):
        '''
        Deploys client configuration to the hosts on the cluster.
        '''
        client = self.client
        #-----------------------------------------------------------------------
        # TODO: make sure there are additional hosts in the cluster
        #-----------------------------------------------------------------------
        try:
            logger.info('Deploying client configurations')
            cmd = self.deploy_client_config()
        except ApiException:
            logger.error('Problem deploying client configuration')
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            if not cmd.wait(CMD_TIMEOUT).success:
                logger.error('Timeout deploying client configurations')
            else:
                logger.info('Deployed client configuration')


class ClouderaManagerHost(ApiHost):
    '''
    '''
    _ATTRIBUTES = {
      'client'            : None,
      'hostId'            : None,
      'hostname'          : None,
      'ipAddress'         : None,
      'rackId'            : None,
      'status'            : ROAttr(),
      'lastHeartbeat'     : ROAttr(datetime),
      'roleRefs'          : ROAttr(ApiRoleRef),
      'healthSummary'     : ROAttr(),
      'healthChecks'      : ROAttr(),
      'hostUrl'           : ROAttr(),
      'commissionState'   : ROAttr(),
      'maintenanceMode'   : ROAttr(),
      'maintenanceOwners' : ROAttr(),
      'numCores'          : ROAttr(),
      'totalPhysMemBytes' : ROAttr(),
    }

    def __init__(self,
                 client,
                 hostname=None,
                 address=None):
        '''
        '''
        self.client = client

        hosts = client.get_all_hosts()
        salt  = client.salt

        if hostname is None:
            hostname = salt.function('config.get', 'nodename')

        if address is None:
            address  = salt.get_address(hostname)

        if not any(h.hostId == hostname for h in hosts):
            host = self._create(hostname, address)
        else:
            host = self._get(hostname)

        self.__dict__.update(host.__dict__)


    def _create(self, hostname, address=None):
        '''
        Create a host.

        @param hostname: Host name
        @param address:  IP address
        @return:         An ApiHost object
        '''
        client = self.client
        salt   = client.salt

        if address is None:
            address = salt.get_address(hostname)

        try:
            logger.info('Creating host %s', hostname)
            host = client.create_host(hostname, hostname, address)
        except ApiException:
            logger.error('Problem creating host %s', hostname)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            logger.debug('Created host %s', hostname)
            return host


    def _get(self, hostname):
        '''
        Look up a host by id.

        @param hostname: Host name
        @return:         An ApiHost object
        '''
        client = self.client

        try:
            logger.debug('Getting host %s', hostname)
            host = client.get_host(hostname)
        except ApiException:
            logger.error('Problem getting host %s', hostname)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            logger.debug('Got host %s', hostname)
            return host


class ClusterHost(ApiHost):
    '''
    '''
    def __init__(self, cluster, hostname=None):
        '''
        '''
        client = cluster.client
        salt   = client.salt

        if hostname is None:
            hostname = salt.function('config.get', 'nodename')

        if not any(any(h.hostId == hostname for h in cluster.list_hosts())
                                            for c in client.get_all_clusters()):

            try:
                logger.info('Adding host %s to %s', hostname, cluster.name)
                cluster.add_hosts([hostname])
            except ApiException:
                logger.error('Problem adding host %s', hostname)
#               sys.exit(1)
            except URLError:
                logger.error('Problem connecting to %s', client.server_host)
                sys.exit(1)
            else:
                logger.debug('Added host %s to %s', hostname, cluster.name)


class ClusterParcel(ApiParcel):
    '''
     An object that represents the state of a parcel.
    '''
    _ATTRIBUTES = {
        'cluster'       : None,
        'parcel'        : None,
        'progress'      : ROAttr(),
        'totalProgress' : ROAttr(),
        'count'         : ROAttr(),
        'totalCount'    : ROAttr(),
        'warnings'      : ROAttr(),
        'errors'        : ROAttr(),
    }

    def __init__(self, cluster, product, version):
        '''
        '''
        self.cluster = cluster

        parcel = cluster.get_parcel(product, version)

        while (parcel.stage == 'UNAVAILABLE'):
            parcel = cluster.get_parcel(product, version)
            time.sleep(1)

        self.parcel  = parcel
        self.parcel  = self._download()
        self.parcel  = self._distribute()
        self.parcel  = self._activate()


    def _download(self):
        '''
        Downloads parcel
        '''
        cluster = self.cluster
        client  = cluster.client
        parcel  = self.parcel
        product = parcel.product
        version = parcel.version

        if parcel.stage == 'AVAILABLE_REMOTELY':

            try:
                logger.info('Downloading parcel %s', product)
                cmd = parcel.start_download()
            except ApiException:
                logger.error('Problem downloading parcel %s', product)
#               sys.exit(1)
            except URLError:
                logger.error('Problem connecting to %s', client.server_host)
                sys.exit(1)
            else:
                while (parcel.stage == 'AVAILABLE_REMOTELY' or
                       parcel.stage == 'DOWNLOADING'):
                    parcel = cluster.get_parcel(product, version)
                    time.sleep(1)

                logger.info('Downloaded parcel %s', product)

        return parcel


    def _distribute(self):
        '''
        Distributes parcel
        '''
        cluster = self.cluster
        client  = cluster.client
        parcel  = self.parcel
        product = parcel.product
        version = parcel.version

        #-----------------------------------------------------------------------
        # TODO: make sure roles are defined before attempting distribution
        #-----------------------------------------------------------------------

        if parcel.stage == 'DOWNLOADED':

            try:
                logger.info('Distributing parcel %s', product)
                cmd = parcel.start_distribution()
            except ApiException:
                logger.error('Problem distributing parcel %s', product)
#               sys.exit(1)
            except URLError:
                logger.error('Problem connecting to %s', client.server_host)
                sys.exit(1)
            else:
                while (parcel.stage == 'DOWNLOADED' or
                       parcel.stage == 'DISTRIBUTING'):
                    parcel = cluster.get_parcel(product, version)
                    time.sleep(1)

                logger.info('Distributed parcel %s', product)

        return parcel


    def _activate(self):
        '''
        Activates parcel
        '''
        cluster = self.cluster
        client  = cluster.client
        parcel  = self.parcel
        product = parcel.product

        if parcel.stage == 'DISTRIBUTED':

            try:
                logger.info('Activating parcel %s', product)
                cmd = parcel.activate()
            except ApiException:
                logger.error('Problem activating parcel %s', product)
#               sys.exit(1)
            except URLError:
                logger.error('Problem connecting to %s', client.server_host)
                sys.exit(1)
            else:
                if not cmd.wait(CMD_TIMEOUT).success:
                    logger.error('Timeout activating parcel %s', product)
                    sys.exit(1)
                else:
                    logger.info('Activated parcel %s', product)

        return parcel


class ClusterService(ApiService):
    '''
    Cloudera Manager service object
    '''
    _ATTRIBUTES = {
      'cluster'           : None,
      'name'              : None,
      'type'              : None,
      'displayName'       : None,
      'serviceState'      : ROAttr(),
      'healthSummary'     : ROAttr(),
      'healthChecks'      : ROAttr(),
      'clusterRef'        : ROAttr(ApiClusterRef),
      'configStale'       : ROAttr(),
      'serviceUrl'        : ROAttr(),
      'maintenanceMode'   : ROAttr(),
      'maintenanceOwners' : ROAttr(),
    }

    def __init__(self, cluster, service_type, service_name=None):
        '''
        '''
        self.cluster = cluster

        client   = cluster.client
        config   = client.config
        instance = config.get('DEFAULT', 'instance')
        services = cluster.get_all_services()

        if service_name is None:
            service_name = service_type.lower() + instance

        if not any(s.name == service_name for s in services):
            service = self._create(service_name, service_type)
        else:
            service = self._get(service_name)

        self.__dict__.update(service.__dict__)

        self._update_config()
        self._create_roles()


    def _create(self, service_name=None, service_type=None):
        '''
        Create a service.

        @param service_name: Service name
        @param service_type: Service type
        @return:             An ApiService object
        '''
        cluster = self.cluster
        client  = cluster.client

        try:
            logger.info('Creating service %s', service_name)
            service = cluster.create_service(service_name, service_type)
        except ApiException:
            logger.error('Problem creating service %s', service_name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            return service


    def _get(self, service_name):
        '''
        Look up a service by id.

        @param service_name: Service name
        @return:             An ApiService object
        '''
        cluster = self.cluster
        client  = cluster.client

        try:
            logger.debug('Getting service %s', service_name)
            service = cluster.get_service(service_name)
        except ApiException:
            logger.error('Problem getting service %s', service_name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            return service


    def _delete_role(self, role):
        '''
        Deletes role
        '''
        cluster = self.cluster
        client  = cluster.client

        try:
            logger.info('Deleting role %s', role)
            self.delete_role(role)
        except ApiException:
            logger.error('Problem deleting role %s', role)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)


    def _get_config(self):
        '''
        Gets service configuration
        '''
        cluster = self.cluster
        client  = cluster.client

        try:
            logger.info('Getting configuration for %s', self.name)
            params = dict((k, v.value) for
                           k, v in self.get_config(view='full')[0].items())
        except ApiException:
            logger.error('Problem getting configuration for %s', self.name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            return params


    def _update_config(self):
        '''
        Updates service configuration
        '''
        cluster = self.cluster
        client  = cluster.client
        config  = client.config

        section = self.type

        if config.has_section(section):
            params = dict((k,   config.get(section, k)) for
                           k in sorted(config._sections[section].iterkeys()) if
                           k != '__name__')

            _get = self._get_config()
            _set = params

            if cmp(_get, dict(_get.items() + _set.items())) == 0:
                logger.debug('Configuration for %s has not changed', self.name)
            else:
                try:
                    logger.info('Updating configuration for %s', self.name)
                    self.update_config(params)
                except ApiException:
                    logger.error('Problem updating configuration for %s', self.name)
#                   sys.exit(1)
                except URLError:
                    logger.error('Problem connecting to %s', client.server_host)
                    sys.exit(1)
                else:
                    self._start()


    def _create_roles(self, hostname=None):
        '''
        Creates all roles for specific host
        '''
        cluster    = self.cluster
        client     = cluster.client
        salt       = client.salt
        role_types = self.get_role_types()

        if hostname is None:
            hostname = salt.function('config.get', 'nodename')

        grains = salt.function('mine.get', hostname, 'grains.item')[hostname]
        roles  = grains.get('roles')

        for role_type in role_types:
            if role_map[self.type].get(role_type) in roles:
                role              = ServiceRole(self, role_type)
                role_config_group = ServiceRoleConfigGroup(self, role_type)


    def _start(self):
        '''
        Starts service
        '''
        cluster = self.cluster
        client  = cluster.client
        #---------------------------------------------------------------------------
        # TODO: restart if configuration changes
        #---------------------------------------------------------------------------
        try:
            if 'STARTED' in self.serviceState:
                logger.info('Restarting %s', self.name)
                cmd = self.restart()
            else:
                logger.info('Starting %s', self.name)
                cmd = self.start()
        except ApiException:
            logger.error('Problem starting %s', self.name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            if not cmd.wait(CMD_TIMEOUT).success:
                logger.error('Timeout starting %s', self.name)
#               sys.exit(1)
            else:
                logger.info('Started %s', self.name)


class ClusterZookeeper(ClusterService):
    '''
    Cloudera Manager zookeeper service object
    '''
    def __init__(self, cluster, hostname=None):
        '''
        '''
        client = cluster.client
        salt   = client.salt

        service_type = 'ZOOKEEPER'
        roles        = role_map[service_type].itervalues()

        if hostname is None:
            hostname = salt.function('config.get', 'nodename')

        if any(r in salt.function('mine.get', hostname,
                                  'grains.item').get(hostname)['roles'] for
               r in roles):
            ClusterService.__init__(self, cluster, service_type=service_type)

            hash      = hashlib.md5(hostname).hexdigest()
            role_name = self.name + '-SERVER-' + hash

            if 'STARTED' not in self.get_role(role_name).roleState:
                logger.info('Initializing zookeeper')
                self.init_zookeeper(hostname)

                time.sleep(30)
                self._start()


class ClusterHDFS(ClusterService):
    '''
    Cloudera Manager HDFS service object
    '''
    def __init__(self, cluster, hostname=None):
        '''
        '''
        client = cluster.client
        config = client.config
        salt   = client.salt

        service_type = 'HDFS'
        roles        = role_map[service_type].itervalues()

        if hostname is None:
            hostname = salt.function('config.get', 'nodename')

        if any(r in salt.function('config.get', 'roles') for r in roles):
            ClusterService.__init__(self, cluster, service_type=service_type)

            dns = salt.function('roles.dict', 'hadoop-hdfs-datanode')['hadoop-hdfs-datanode']
            nns = salt.function('roles.dict', 'hadoop-hdfs-namenode')['hadoop-hdfs-namenode']
            sns = salt.function('roles.dict', 'hadoop-hdfs-secondarynamenode')['hadoop-hdfs-secondarynamenode']
            jns = salt.function('roles.dict', 'hadoop-hdfs-journalnode')['hadoop-hdfs-journalnode']
            zks = salt.function('roles.dict', 'zookeeper-server')['zookeeper-server']

            if (len(dns) >= 1 and
                len(nns) >= 1):

                self._create_roles(hostname)

                if (len(nns) >  1 and
                    len(jns) >= 3 and
                    len(zks) >= 1):

                    for sn in sns:
                        hash      = hashlib.md5(sn).hexdigest()
                        role_name = self.name + '-SECONDARYNAMENODE-' + hash

                        self.delete_role(role_name)

                    self._enable_hdfs_ha(hosts=nns)

                elif (len(nns) >= 1 and
                      len(sns) >= 1):

                    for jn in jns:
                        hash      = hashlib.md5(jn).hexdigest()
                        role_name = self.name + '-JOURNALNODE-' + hash

                        self.delete_role(role_name)
                    #-----------------------------------------------------------
                    # TODO: make sure ha partner exists
                    #-----------------------------------------------------------
                    self._format()
                    self._start()


    def _create_roles(self, hostname=None):
        '''
        Updates all hdfs datanode configurations
        '''
        cluster    = self.cluster
        client     = cluster.client
        salt       = client.salt
        role_types = self.get_role_types()

        if hostname is None:
            hostname  = salt.function('config.get', 'nodename')

        grains = salt.function('mine.get', hostname,
                               'grains.item').get(hostname)
        roles  = grains.get('roles')

        mounts = salt.function('mine.get', hostname,
                               'mount.active').get(hostname).iterkeys()
        dirs   = []

        for mount in mounts:
            if mount.startswith('/data/'):
                dirs.append(mount + '/dfs/' + self.type.lower()[0] + 'n')

        for role_type in role_types:
            if role_map[self.type].get(role_type) in roles:
                if   'DATANODE'          in role_type:
                    key = 'dfs_data_dir_list'
                elif 'JOURNALNODE'       in role_type:
                    key = 'dfs_journalnode_edits_dir'
                elif 'SECONDARYNAMENODE' in role_type:
                    key = 'fs_checkpoint_dir_list'
                elif 'NAMENODE'          in role_type:
                    key = 'dfs_name_dir_list'

                params = {key: ','.join(sorted(dirs))}

                role              = ServiceRole(self, role_type, params)
                role_config_group = ServiceRoleConfigGroup(self, role_type)


    def _enable_hdfs_ha(self):
        '''
        Enables HDFS high availability
        '''
        cluster     = self.cluster
        client      = cluster.client
        config      = client.config
        nameservice = config.get('HDFS:NAMENODE',
                                 'dfs_federation_namenode_nameservice')
        salt        = client.salt
        nns         = salt.function('roles.dict', 'hadoop-hdfs-namenode')['hadoop-hdfs-namenode']

        try:
            logger.info('Enabling HDFS high availability')
            cmd = self.enable_hdfs_ha(nns[0], '', nns[1], '', nameservice,
                                      True, True, True)
        except ApiException:
            logger.error('Problem enabling HDFS high availability')
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            if not cmd.wait(CMD_TIMEOUT).success:
                logger.error('Timeout enabling HDFS high availability')
                sys.exit(1)


    def _format(self):
        '''
        Formats HDFS
        '''
        cluster = self.cluster
        client  = cluster.client
        #-------------------------------------------------------------------
        # TODO: test whether hdfs is already formatted
        #-------------------------------------------------------------------
        for role in self.get_roles_by_type('NAMENODE'):
            if 'STARTED' not in role.roleState:

                try:
                    logger.info('Formatting HDFS')
                    cmd = self.format_hdfs(role.name)[0]
                except ApiException:
                    logger.error('Problem formatting HDFS')
#                   sys.exit(1)
                except URLError:
                    logger.error('Problem connecting to %s', client.server_host)
                    sys.exit(1)
                else:
                    if not cmd.wait(CMD_TIMEOUT).success:
                        logger.error('Timeout formatting hdfs')


    def _start(self):
        '''
        Starts service
        '''
        dns = self.get_roles_by_type('DATANODE')
        nns = self.get_roles_by_type('NAMENODE')
        sns = self.get_roles_by_type('SECONDARYNAMENODE')

        if dns and nns and sns:
            ClusterService._start(self)
        else:
            logger.warn('Missing roles')


class ClusterHBase(ClusterService):
    '''
    Cloudera Manager HBase service object
    '''
    def __init__(self, cluster, hostname=None):
        '''
        '''
        client = cluster.client
        config = client.config
        salt   = client.salt

        service_type = 'HBASE'
        roles        = role_map[service_type].itervalues()

        if hostname is None:
            hostname = salt.function('config.get', 'nodename')

        if any(r in salt.function('config.get', 'roles') for r in roles):
            ClusterService.__init__(self, cluster, service_type=service_type)

            hms = salt.function('roles.dict', 'hbase-master')['hbase-master']
            hrs = salt.function('roles.dict', 'hbase-regionserver')['hbase-regionserver']
            zks = salt.function('roles.dict', 'zookeeper-server')['zookeeper-server']

            if (len(hms) == 1 and
                len(hrs) >= 1 and
                len(zks) >= 1):

                self.create_root()
                self._start()


    def create_root(self):
        '''
        Creates HBase root directory on HDFS
        '''
        cluster = self.cluster
        client  = cluster.client

        if 'STOPPED' in self.serviceState:

            try:
                logger.info('Creating HBase root')
                cmd = self.create_hbase_root()
            except ApiException:
                logger.error('Problem creating HBase root')
#               sys.exit(1)
            except URLError:
                logger.error('Problem connecting to %s', client.server_host)
                sys.exit(1)
            else:
                if not cmd.wait(CMD_TIMEOUT).success:
                    logger.error('Timeout creating HBase root')


    def _start(self):
        '''
        Starts service
        '''
        cluster = self.cluster

        zk  = self.get_config()[0]['zookeeper_service']
        zks = cluster.get_service(zk).get_roles_by_type('SERVER')
        hms = self.get_roles_by_type('MASTER')
        hrs = self.get_roles_by_type('REGIONSERVER')

        if zks and hms and hrs:
            ClusterService._start(self)
        else:
            logger.warn('Missing roles')


class ServiceRole(ApiRole):
    '''
    Cloudera Manager role object
    '''
    _ATTRIBUTES = {
        'service'             : None,
        'name'                : None,
        'type'                : None,
        'hostRef'             : Attr(ApiHostRef),
        'roleState'           : ROAttr(),
        'healthSummary'       : ROAttr(),
        'healthChecks'        : ROAttr(),
        'serviceRef'          : ROAttr(ApiServiceRef),
        'configStale'         : ROAttr(),
        'haStatus'            : ROAttr(),
        'roleUrl'             : ROAttr(),
        'commissionState'     : ROAttr(),
        'maintenanceMode'     : ROAttr(),
        'maintenanceOwners'   : ROAttr(),
        'roleConfigGroupRef'  : ROAttr(ApiRoleConfigGroupRef),
    }

    def __init__(self, service, role_type, params={},
                 role_name=None, hostname=None):
        '''
        '''
        self.service = service

        cluster = service.cluster
        client  = cluster.client
        salt    = client.salt

        if hostname is None:
            hostname = salt.function('config.get', 'nodename')
            hash     = hashlib.md5(hostname).hexdigest()

        if role_name is None:
            role_name = service.name + '-' + role_type + '-' + hash

        if not any(r.name == role_name for r in service.get_all_roles()):
            role = self._create(role_type, role_name, hostname)
        else:
            role = self._get(role_name)

        self.__dict__.update(role.__dict__)

        self._update_config(params)


    def _create(self, role_type=None, role_name=None, hostname=None):
        '''
        Create a role.

        @param role_type: Role type
        @param role_name: Role name
        @param hostname:  ID of the host to assign the role to
        @return:          An ApiRole object
        '''
        service = self.service
        cluster = service.cluster
        client  = cluster.client
        salt    = client.salt

        if hostname is None:
            hostname = salt.function('config.get', 'nodename')
            hash     = hashlib.md5(hostname).hexdigest()

        if role_name is None:
            role_name = service.name + '-' + role_type + '-' + hash

        try:
            logger.info('Creating role %s', role_name)
            role = service.create_role(role_name, role_type, hostname)
        except ApiException:
            logger.error('Problem creating role %s', role_name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            return role


    def _get(self, role_name):
        '''
        Look up a role by name.

        @param role_name: Role name
        @return:          An ApiRole object
        '''
        service = self.service
        cluster = service.cluster
        client  = cluster.client

        try:
            logger.debug('Getting role %s', role_name)
            role = service.get_role(role_name)
        except ApiException:
            logger.error('Problem getting role %s', role_name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            return role


    def _get_config(self):
        '''
        Gets role configuration
        '''
        service = self.service
        cluster = service.cluster
        client  = cluster.client

        try:
            logger.info('Getting configuration for %s', self.name)
            params = dict((k, v.value) for
                           k, v in self.get_config(view='full').items())
        except ApiException:
            logger.error('Problem getting configuration for %s', self.name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            return params


    def _update_config(self, params={}):
        '''
        Updates role configuration
        '''
        service   = self.service
        cluster   = service.cluster
        client    = cluster.client
        salt      = client.salt

        _get = self._get_config()
        _set = params

        if cmp(_get, dict(_get.items() + _set.items())) == 0:
            logger.debug('Configuration for %s has not changed', self.name)
        else:
            try:
                logger.info('Updating configuration for %s', self.name)
                self.update_config(params)
            except ApiException:
                logger.error('Problem updating configuration for %s', self.name)
#               sys.exit(1)
            except URLError:
                logger.error('Problem connecting to %s', client.server_host)
                sys.exit(1)
            else:
                self._start()


    def _start(self):
        '''
        Starts role
        '''
        service = self.service
        cluster = service.cluster
        client  = cluster.client
        #---------------------------------------------------------------------------
        # TODO: restart if configuration changes
        #---------------------------------------------------------------------------
        try:
            if 'STARTED' in self.roleState:
                logger.info('Restarting %s', self.name)
                cmd = service.restart_roles(self.name)[0]
            else:
                logger.info('Starting %s', self.name)
                cmd = service.start_roles(self.name)[0]
        except ApiException:
            logger.error('Problem starting %s', self.name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            if not cmd.wait(CMD_TIMEOUT).success:
                logger.error('Timeout starting %s', self.name)
                sys.exit(1)
            else:
                logger.info('Started %s', self.name)


class ServiceRoleConfigGroup(ApiRoleConfigGroup):
    '''
    '''
    _ATTRIBUTES = {
        'service'     : None,
        'name'        : None,
        'displayName' : None,
        'roleType'    : None,
        'config'      : Attr(ApiConfig),
        'base'        : ROAttr(),
        'serviceRef'  : ROAttr(ApiServiceRef),
    }

    def __init__(self, service, role_type, role_config_group_name=None):
        '''
        '''
        self.service = service

        role_config_groups = service.get_all_role_config_groups()

        if role_config_group_name is None:
            role_config_group_name = service.name + '-' + role_type + '-BASE'

        if not any(r.name == role_config_group_name for r in role_config_groups):
            role_config_group = self._create(role_config_group_name)
        else:
            role_config_group = self._get(role_config_group_name)

        self.__dict__.update(role_config_group.__dict__)

        self._update_config(role_type)


    def _get(self, role_config_group_name):
        '''
        Look up a role config group by id.
        '''
        service = self.service
        cluster = service.cluster
        client  = cluster.client

        try:
            logger.debug('Getting role config group %s', role_config_group_name)
            role_config_group = service.get_role_config_group(role_config_group_name)
        except ApiException:
            logger.error('Problem getting role config group %s', role_config_group_name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            return role_config_group


    def _get_config(self):
        '''
        Gets individual role configuration group
        '''
        service = self.service
        cluster = service.cluster
        client  = cluster.client

        try:
            logger.info('Getting configuration for %s', self.name)
            params = dict((k, v.value) for
                           k, v in self.get_config(view='full').items())
        except ApiException:
            logger.error('Problem getting configuration for %s', self.name)
#           sys.exit(1)
        except URLError:
            logger.error('Problem connecting to %s', client.server_host)
            sys.exit(1)
        else:
            return params


    def _update_config(self, role_type):
        '''
        Updates individual role configuration group
        '''
        service = self.service
        cluster = service.cluster
        client  = cluster.client
        config  = client.config
        salt    = client.salt

        section                = service.type + ':' + role_type
        role_config_group_name = service.name + '-' + role_type + '-BASE'
        file                   = role_map[service.type].get(role_type)

        params = {}

        if config.has_section(section):
            params  = dict((k,   config.get(section, k)) for
                            k in config._sections[section].iterkeys() if
                            k != '__name__')

        if (salt.function('roles.dict', 'graphite-carbon')['graphite-carbon'] or
            salt.function('roles.dict', 'influxdb')['influxdb']):
            jar   = '/opt/jmxtrans/lib/jmxtrans-agent.jar'
            xml   = '/opt/jmxtrans/etc/' + file + '.xml'
            agent = ' -javaagent:' + jar + '=' + xml

            keys  = self.get_config(view='full').iterkeys()

            k = [k for k in keys if 'java_opts' in k][0]
            v = self.get_config(view='full')[k].value
            #-------------------------------------------------------------------
            # TODO: test for presence of jar and xml files
            #-------------------------------------------------------------------
            if v and 'jmxtrans' not in v:
                v += agent
            else:
                v  = agent

            params[k] = v.strip()

        _get = self._get_config()
        _set = params

        if cmp(_get, dict(_get.items() + _set.items())) == 0:
            logger.debug('Configuration for %s has not changed', self.name)
        else:
            try:
                logger.info('Updating configuration for %s', self.name)
                self.update_config(params)
            except ApiException:
                logger.error('Problem updating configuration for %s', self.name)
#               sys.exit(1)
            except URLError:
                logger.error('Problem connecting to %s', client.server_host)
                sys.exit(1)


class Config(ConfigParser):
    '''
    '''
    def __init__(self):
        '''
        Gets configuration of pertinent services and roles
        '''
        ConfigParser.__init__(self)

        self.optionxform = str
        self.read('/root/bin/cm_client.ini')


class Salt(Caller):
    '''
    '''
    def __init__(self):
        '''
        '''
        Caller.__init__(self)


    def get_hosts(self, roles=None):
        '''
        Gets set of hosts performing pertinent roles
        '''
        hosts  = set()

        if roles is None:
            services = [v.itervalues() for v in role_map.itervalues()]
            roles    = set(chain.from_iterable(services))
        if isinstance(roles, str):
            roles    = set([roles])

        for role in roles:
            hosts |= set(self.function('roles.dict', role)[role])

        return hosts


    def get_address(self, hostname=None):
        '''
        Gets host IP address
        '''
        #-----------------------------------------------------------------------
        # TODO: dynamically discover interface
        #-----------------------------------------------------------------------
        if hostname is None:
            hostname = self.function('config.get', 'nodename')

        grains  = self.function('mine.get', hostname, 'grains.item')
        address = grains[hostname]['fqdn_ip4'][0]

        return address


def main():
    '''
    Cloudera Manager API
    '''
    client  = ClouderaManagerClient()


if  __name__ == '__main__':
    main()
