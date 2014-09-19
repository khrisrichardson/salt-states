# logstash

## Description:

An extensible logging pipeline

## Depends:

  -  [debianutils](/salt/debianutils)
  -  [libzmq3-dev](/salt/libzmq3-dev)
  -  [oracle-j2sdk1\_7](/salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer](/salt/oracle-java7-installer)
  -  [python-apt](/salt/python-apt)
  -  [ruby-ffi-rzmq](/salt/ruby-ffi-rzmq)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [ceph](/salt/ceph)
  -  [cinder-api](/salt/cinder-api)
  -  [cinder-backup](/salt/cinder-backup)
  -  [cinder-scheduler](/salt/cinder-scheduler)
  -  [cinder-volume](/salt/cinder-volume)
  -  [corosync](/salt/corosync)
  -  [glance-api](/salt/glance-api)
  -  [glance-registry](/salt/glance-registry)
  -  [heat-api](/salt/heat-api)
  -  [heat-api-cfn](/salt/heat-api-cfn)
  -  [heat-api-cloudwatch](/salt/heat-api-cloudwatch)
  -  [heat-engine](/salt/heat-engine)
  -  [keystone](/salt/keystone)
  -  [libvirt-bin](/salt/libvirt-bin)
  -  [neutron-dhcp-agent](/salt/neutron-dhcp-agent)
  -  [neutron-l3-agent](/salt/neutron-l3-agent)
  -  [neutron-lbaas-agent](/salt/neutron-lbaas-agent)
  -  [neutron-metadata-agent](/salt/neutron-metadata-agent)
  -  [neutron-plugin-ibm-agent](/salt/neutron-plugin-ibm-agent)
  -  [neutron-plugin-linuxbridge-agent](/salt/neutron-plugin-linuxbridge-agent)
  -  [neutron-plugin-mlnx-agent](/salt/neutron-plugin-mlnx-agent)
  -  [neutron-plugin-nec-agent](/salt/neutron-plugin-nec-agent)
  -  [neutron-plugin-oneconvergence-agent](/salt/neutron-plugin-oneconvergence-agent)
  -  [neutron-plugin-openflow-agent](/salt/neutron-plugin-openflow-agent)
  -  [neutron-plugin-openvswitch-agent](/salt/neutron-plugin-openvswitch-agent)
  -  [neutron-plugin-ryu-agent](/salt/neutron-plugin-ryu-agent)
  -  [neutron-server](/salt/neutron-server)
  -  [nova-api](/salt/nova-api)
  -  [nova-api-ec2](/salt/nova-api-ec2)
  -  [nova-api-metadata](/salt/nova-api-metadata)
  -  [nova-api-os-compute](/salt/nova-api-os-compute)
  -  [nova-baremetal](/salt/nova-baremetal)
  -  [nova-cells](/salt/nova-cells)
  -  [nova-cert](/salt/nova-cert)
  -  [nova-common](/salt/nova-common)
  -  [nova-compute](/salt/nova-compute)
  -  [nova-conductor](/salt/nova-conductor)
  -  [nova-console](/salt/nova-console)
  -  [nova-consoleauth](/salt/nova-consoleauth)
  -  [nova-network](/salt/nova-network)
  -  [nova-novncproxy](/salt/nova-novncproxy)
  -  [nova-objectstore](/salt/nova-objectstore)
  -  [nova-scheduler](/salt/nova-scheduler)
  -  [nova-spiceproxy](/salt/nova-spiceproxy)
  -  [nova-xvpvncproxy](/salt/nova-xvpvncproxy)
  -  [openvswitch-switch](/salt/openvswitch-switch)
  -  [rabbitmq-server](/salt/rabbitmq-server)
  -  [radosgw](/salt/radosgw)
  -  [radosgw-agent](/salt/radosgw-agent)
  -  [trove-api](/salt/trove-api)
  -  [trove-guestagent](/salt/trove-guestagent)
  -  [trove-taskmanager](/salt/trove-taskmanager)

## Relates:

  -  [elasticsearch](/salt/elasticsearch)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       ├── input-file-syslog.conf
│   │       ├── input-log4j.conf
│   │       ├── input-redis.conf
│   │       ├── input-syslog.conf
│   │       ├── input-udp.conf
│   │       ├── input-zeromq.conf
│   │       ├── output-elasticsearch.conf
│   │       ├── output-file.conf
│   │       ├── output-redis.conf
│   │       └── output-zeromq.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-logstash.json
│   └── systemd
│       └── system
│           └── logstash.service
├── init.sls
├── relate-elasticsearch.sls
└── relate-sensu-api.sls

8 directories, 17 files
```
