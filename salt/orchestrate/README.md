# orchestrate

## Description:

This state instructs the minion to manage other states, which are either
related to another minion or a list of roles. If no minion or roles are
declared, then this state instructs the minion to manage all states that have
relations to all other roles in the environment.

## Depends:

  -  N/A

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── apache2
│   └── init.sls
├── apt-cacher-ng
│   └── init.sls
├── auditd
│   └── init.sls
├── beaver
│   └── init.sls
├── cacti
│   └── init.sls
├── calamari
│   └── init.sls
├── cassandra
│   └── init.sls
├── ceilometer-agent-central
│   └── init.sls
├── ceilometer-agent-compute
│   └── init.sls
├── ceilometer-agent-notification
│   └── init.sls
├── ceilometer-alarm-evaluator
│   └── init.sls
├── ceilometer-alarm-notifier
│   └── init.sls
├── ceilometer-api
│   └── init.sls
├── ceilometer-collector
│   └── init.sls
├── ceilometer-common
│   └── init.sls
├── ceph
│   └── init.sls
├── ceph-deploy
│   └── init.sls
├── ceph-mds
│   └── init.sls
├── ceph-mon
│   └── init.sls
├── ceph-osd
│   └── init.sls
├── cinder-api
│   └── init.sls
├── cinder-backup
│   └── init.sls
├── cinder-common
│   └── init.sls
├── cinder-scheduler
│   └── init.sls
├── cinder-volume
│   └── init.sls
├── cloudera-cm4-agent
│   └── init.sls
├── cloudera-cm4-daemons
│   └── init.sls
├── cloudera-cm4-server
│   └── init.sls
├── cloudera-cm4-server-db
│   └── init.sls
├── cloudera-cm5-agent
│   └── init.sls
├── cloudera-cm5-daemons
│   └── init.sls
├── cloudera-cm5-server
│   └── init.sls
├── cloudera-cm5-server-db
│   └── init.sls
├── cobbler
│   └── init.sls
├── collectd
│   └── init.sls
├── coreos
│   └── init.sls
├── coreos-ipxe-server
│   └── init.sls
├── corosync
│   └── init.sls
├── cron
│   └── init.sls
├── descartes
│   └── init.sls
├── docker-registry
│   └── init.sls
├── dynaTrace-analysis-server
│   └── init.sls
├── dynaTrace-collector
│   └── init.sls
├── dynaTrace-common
│   └── init.sls
├── dynaTrace-server
│   └── init.sls
├── ebtables
│   └── init.sls
├── elasticsearch
│   └── init.sls
├── elasticsearch-bigdesk
│   └── init.sls
├── elasticsearch-head
│   └── init.sls
├── elasticsearch-hq
│   └── init.sls
├── elasticsearch-kopf
│   └── init.sls
├── elasticsearch-paramedic
│   └── init.sls
├── etcd
│   └── init.sls
├── fleet
│   └── init.sls
├── ganglia
│   └── init.sls
├── ganglia-monitor
│   └── init.sls
├── gitlab
│   └── init.sls
├── glance-api
│   └── init.sls
├── glance-registry
│   └── init.sls
├── glusterfs-server
│   └── init.sls
├── gmetad
│   └── init.sls
├── grafana
│   └── init.sls
├── graphite-carbon
│   └── init.sls
├── graphite-web
│   └── init.sls
├── gunicorn
│   └── init.sls
├── guvnor
│   └── init.sls
├── guvnor-postgresql
│   └── init.sls
├── guvnor-proxy
│   └── init.sls
├── hadoop
│   └── init.sls
├── hadoop-hdfs
│   └── init.sls
├── hadoop-hdfs-datanode
│   └── init.sls
├── hadoop-hdfs-journalnode
│   └── init.sls
├── hadoop-hdfs-namenode
│   └── init.sls
├── hadoop-hdfs-secondarynamenode
│   └── init.sls
├── haproxy
│   └── init.sls
├── hbase
│   └── init.sls
├── hbase-master
│   └── init.sls
├── hbase-regionserver
│   └── init.sls
├── hbase-zookeeper
│   └── init.sls
├── heat-api
│   └── init.sls
├── heat-api-cfn
│   └── init.sls
├── heat-api-cloudwatch
│   └── init.sls
├── heat-common
│   └── init.sls
├── heat-engine
│   └── init.sls
├── incron
│   └── init.sls
├── influxdb
│   └── init.sls
├── init.sls
├── ironic-api
│   └── init.sls
├── ironic-common
│   └── init.sls
├── ironic-conductor
│   └── init.sls
├── iscsitarget
│   └── init.sls
├── java-common
│   └── init.sls
├── jenkins
│   └── init.sls
├── keepalived
│   └── init.sls
├── keystone
│   └── init.sls
├── kibana
│   └── init.sls
├── libvirt-bin
│   └── init.sls
├── logstash
│   └── init.sls
├── lxc-docker
│   └── init.sls
├── mapred-jobtracker
│   └── init.sls
├── mariadb-server
│   └── init.sls
├── maven
│   └── init.sls
├── memcached
│   └── init.sls
├── mesos-master
│   └── init.sls
├── mesos-slave
│   └── init.sls
├── mongodb-server
│   └── init.sls
├── multipath-tools
│   └── init.sls
├── mysql-server
│   └── init.sls
├── nagios3
│   └── init.sls
├── nagios-nrpe-server
│   └── init.sls
├── neutron-common
│   └── init.sls
├── neutron-dhcp-agent
│   └── init.sls
├── neutron-l3-agent
│   └── init.sls
├── neutron-lbaas-agent
│   └── init.sls
├── neutron-metadata-agent
│   └── init.sls
├── neutron-metering-agent
│   └── init.sls
├── neutron-plugin-bigswitch-agent
│   └── init.sls
├── neutron-plugin-ibm-agent
│   └── init.sls
├── neutron-plugin-linuxbridge-agent
│   └── init.sls
├── neutron-plugin-mlnx-agent
│   └── init.sls
├── neutron-plugin-nec-agent
│   └── init.sls
├── neutron-plugin-oneconvergence-agent
│   └── init.sls
├── neutron-plugin-openflow-agent
│   └── init.sls
├── neutron-plugin-openvswitch-agent
│   └── init.sls
├── neutron-plugin-ryu-agent
│   └── init.sls
├── neutron-plugin-vmware
│   └── init.sls
├── neutron-server
│   └── init.sls
├── neutron-vpn-agent
│   └── init.sls
├── newrelic-daemon
│   └── init.sls
├── newrelic-sysmond
│   └── init.sls
├── nfs-kernel-server
│   └── init.sls
├── nginx-common
│   └── init.sls
├── nis
│   └── init.sls
├── node-giraffe-web
│   └── init.sls
├── node-redis-commander
│   └── init.sls
├── nova-api
│   └── init.sls
├── nova-api-ec2
│   └── init.sls
├── nova-api-metadata
│   └── init.sls
├── nova-api-os-compute
│   └── init.sls
├── nova-baremetal
│   └── init.sls
├── nova-cells
│   └── init.sls
├── nova-cert
│   └── init.sls
├── nova-common
│   └── init.sls
├── nova-compute
│   └── init.sls
├── nova-compute-docker
│   └── init.sls
├── nova-compute-kvm
│   └── init.sls
├── nova-compute-lxc
│   └── init.sls
├── nova-compute-qemu
│   └── init.sls
├── nova-compute-xen
│   └── init.sls
├── nova-conductor
│   └── init.sls
├── nova-console
│   └── init.sls
├── nova-consoleauth
│   └── init.sls
├── nova-network
│   └── init.sls
├── nova-novncproxy
│   └── init.sls
├── nova-objectstore
│   └── init.sls
├── nova-scheduler
│   └── init.sls
├── nova-spiceproxy
│   └── init.sls
├── nova-xvpvncproxy
│   └── init.sls
├── ntp
│   └── init.sls
├── ntpdate
│   └── init.sls
├── oozie
│   └── init.sls
├── open-iscsi
│   └── init.sls
├── openssh-server
│   └── init.sls
├── openstack
│   └── init.sls
├── openstack-dashboard
│   └── init.sls
├── openvswitch-controller
│   └── init.sls
├── openvswitch-ipsec
│   └── init.sls
├── openvswitch-switch
│   └── init.sls
├── opsview
│   └── init.sls
├── opsview-agent
│   └── init.sls
├── ovirt-engine
│   └── init.sls
├── pacemaker
│   └── init.sls
├── php5-fpm
│   └── init.sls
├── postfix
│   └── init.sls
├── postgresql
│   └── init.sls
├── privoxy
│   └── init.sls
├── puppet
│   └── init.sls
├── puppetmaster
│   └── init.sls
├── qemu-kvm
│   └── init.sls
├── qpidd
│   └── init.sls
├── rabbitmq-server
│   └── init.sls
├── racoon
│   └── init.sls
├── radosgw
│   └── init.sls
├── radosgw-agent
│   └── init.sls
├── redis-server
│   └── init.sls
├── rsyslog
│   └── init.sls
├── ruby-bluepill
│   └── init.sls
├── run.sls
├── salt-api
│   └── init.sls
├── salt-halite
│   └── init.sls
├── salt-master
│   └── init.sls
├── salt-minion
│   └── init.sls
├── salt-syndic
│   └── init.sls
├── sensu
│   └── init.sls
├── sensu-api
│   └── init.sls
├── sensu-client
│   └── init.sls
├── sensu-dashboard
│   └── init.sls
├── sensu-server
│   └── init.sls
├── sheepdog
│   └── init.sls
├── skydns2
│   └── init.sls
├── smartmontools
│   └── init.sls
├── snmpd
│   └── init.sls
├── socks5
│   └── init.sls
├── solr
│   └── init.sls
├── solr-zookeeper
│   └── init.sls
├── splunk
│   └── init.sls
├── sudo
│   └── init.sls
├── supervisor
│   └── init.sls
├── swift-account
│   └── init.sls
├── swift-container
│   └── init.sls
├── swift-object
│   └── init.sls
├── swift-object-expirer
│   └── init.sls
├── swift-proxy
│   └── init.sls
├── sysstat
│   └── init.sls
├── tasseo
│   └── init.sls
├── tgt
│   └── init.sls
├── tivoli-storage-manager
│   └── init.sls
├── tomcat7
│   └── init.sls
├── trove-api
│   └── init.sls
├── trove-guestagent
│   └── init.sls
├── trove-taskmanager
│   └── init.sls
├── zookeeperd
│   └── init.sls
└── zookeeper-server
    └── init.sls

250 directories, 252 files
```
