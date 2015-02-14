# supervisor

## Depends:

  -  [logrotate](/salt/logrotate)
  -  [python-pip](/salt/python-pip)
  -  [ruby-supervisor](/salt/ruby-supervisor)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [cadvisor](/salt/cadvisor)
  -  [calamari](/salt/calamari)
  -  [ceilometer-agent-central](/salt/ceilometer-agent-central)
  -  [ceilometer-agent-compute](/salt/ceilometer-agent-compute)
  -  [ceilometer-agent-notification](/salt/ceilometer-agent-notification)
  -  [ceilometer-alarm-evaluator](/salt/ceilometer-alarm-evaluator)
  -  [ceilometer-alarm-notifier](/salt/ceilometer-alarm-notifier)
  -  [ceilometer-api](/salt/ceilometer-api)
  -  [ceilometer-collector](/salt/ceilometer-collector)
  -  [ceph-mon](/salt/ceph-mon)
  -  [cinder-api](/salt/cinder-api)
  -  [cinder-backup](/salt/cinder-backup)
  -  [cinder-scheduler](/salt/cinder-scheduler)
  -  [cinder-volume](/salt/cinder-volume)
  -  [consul-client](/salt/consul-client)
  -  [consul-server](/salt/consul-server)
  -  [consul-web](/salt/consul-web)
  -  [coreos-ipxe-server](/salt/coreos-ipxe-server)
  -  [cron](/salt/cron)
  -  [etcd](/salt/etcd)
  -  [flannel](/salt/flannel)
  -  [fleet](/salt/fleet)
  -  [flynn-host](/salt/flynn-host)
  -  [glance-api](/salt/glance-api)
  -  [glance-registry](/salt/glance-registry)
  -  [graphite-web](/salt/graphite-web)
  -  [heat-api](/salt/heat-api)
  -  [heat-api-cfn](/salt/heat-api-cfn)
  -  [heat-api-cloudwatch](/salt/heat-api-cloudwatch)
  -  [heat-engine](/salt/heat-engine)
  -  [ironic-api](/salt/ironic-api)
  -  [ironic-conductor](/salt/ironic-conductor)
  -  [kafka](/salt/kafka)
  -  [keystone](/salt/keystone)
  -  [kubernetes-apiserver](/salt/kubernetes-apiserver)
  -  [kubernetes-controller-manager](/salt/kubernetes-controller-manager)
  -  [kubernetes-kubelet](/salt/kubernetes-kubelet)
  -  [kubernetes-proxy](/salt/kubernetes-proxy)
  -  [logio-harvester](/salt/logio-harvester)
  -  [logio-server](/salt/logio-server)
  -  [lxd](/salt/lxd)
  -  [mesos-dns](/salt/mesos-dns)
  -  [mesos-master](/salt/mesos-master)
  -  [mesos-slave](/salt/mesos-slave)
  -  [mongodb-server](/salt/mongodb-server)
  -  [neutron-dhcp-agent](/salt/neutron-dhcp-agent)
  -  [neutron-l3-agent](/salt/neutron-l3-agent)
  -  [neutron-lbaas-agent](/salt/neutron-lbaas-agent)
  -  [neutron-metadata-agent](/salt/neutron-metadata-agent)
  -  [neutron-metering-agent](/salt/neutron-metering-agent)
  -  [neutron-plugin-bigswitch-agent](/salt/neutron-plugin-bigswitch-agent)
  -  [neutron-plugin-ibm-agent](/salt/neutron-plugin-ibm-agent)
  -  [neutron-plugin-linuxbridge-agent](/salt/neutron-plugin-linuxbridge-agent)
  -  [neutron-plugin-mlnx-agent](/salt/neutron-plugin-mlnx-agent)
  -  [neutron-plugin-nec-agent](/salt/neutron-plugin-nec-agent)
  -  [neutron-plugin-oneconvergence-agent](/salt/neutron-plugin-oneconvergence-agent)
  -  [neutron-plugin-openflow-agent](/salt/neutron-plugin-openflow-agent)
  -  [neutron-plugin-openvswitch-agent](/salt/neutron-plugin-openvswitch-agent)
  -  [neutron-plugin-ryu-agent](/salt/neutron-plugin-ryu-agent)
  -  [neutron-server](/salt/neutron-server)
  -  [neutron-vpn-agent](/salt/neutron-vpn-agent)
  -  [nova-api](/salt/nova-api)
  -  [nova-api-ec2](/salt/nova-api-ec2)
  -  [nova-api-metadata](/salt/nova-api-metadata)
  -  [nova-api-os-compute](/salt/nova-api-os-compute)
  -  [nova-baremetal](/salt/nova-baremetal)
  -  [nova-cells](/salt/nova-cells)
  -  [nova-cert](/salt/nova-cert)
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
  -  [salt-common](/salt/salt-common)
  -  [salt-halite](/salt/salt-halite)
  -  [salt-master](/salt/salt-master)
  -  [salt-minion](/salt/salt-minion)
  -  [salt-syndic](/salt/salt-syndic)
  -  [skydns2](/salt/skydns2)
  -  [swift-account](/salt/swift-account)
  -  [swift-container](/salt/swift-container)
  -  [swift-object](/salt/swift-object)
  -  [swift-object-expirer](/salt/swift-object-expirer)
  -  [swift-proxy](/salt/swift-proxy)
  -  [trove-api](/salt/trove-api)
  -  [trove-guestagent](/salt/trove-guestagent)
  -  [trove-taskmanager](/salt/trove-taskmanager)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── logrotate.d
│   │   └── supervisor
│   ├── rc.d
│   │   └── init.d
│   │       └── supervisor
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-supervisor.json
│   └── supervisor
│       └── supervisord.conf
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
