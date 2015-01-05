# neutron-common

## Description:

Neutron is a virtual network service for Openstack, and a part of Netstack. Just like OpenStack Nova provides an API to dynamically request and configure virtual servers, Neutron provides an API to dynamically request and configure virtual networks. These networks connect "interfaces" from other OpenStack services (e.g., virtual NICs from Nova VMs). The Neutron API supports extensions to provide advanced network capabilities (e.g., QoS, ACLs, network monitoring, etc.)

This package provides the common files.

## Depends:

  -  [netbase](/salt/netbase)
  -  [procps](/salt/procps)
  -  [sudo](/salt/sudo)

## Reverse Depends:

  -  [neutron-dhcp-agent](/salt/neutron-dhcp-agent)
  -  [neutron-l3-agent](/salt/neutron-l3-agent)
  -  [neutron-lbaas-agent](/salt/neutron-lbaas-agent)
  -  [neutron-metadata-agent](/salt/neutron-metadata-agent)
  -  [neutron-metering-agent](/salt/neutron-metering-agent)
  -  [neutron-plugin-bigswitch](/salt/neutron-plugin-bigswitch)
  -  [neutron-plugin-bigswitch-agent](/salt/neutron-plugin-bigswitch-agent)
  -  [neutron-plugin-brocade](/salt/neutron-plugin-brocade)
  -  [neutron-plugin-cisco](/salt/neutron-plugin-cisco)
  -  [neutron-plugin-hyperv](/salt/neutron-plugin-hyperv)
  -  [neutron-plugin-ibm](/salt/neutron-plugin-ibm)
  -  [neutron-plugin-ibm-agent](/salt/neutron-plugin-ibm-agent)
  -  [neutron-plugin-linuxbridge](/salt/neutron-plugin-linuxbridge)
  -  [neutron-plugin-linuxbridge-agent](/salt/neutron-plugin-linuxbridge-agent)
  -  [neutron-plugin-metaplugin](/salt/neutron-plugin-metaplugin)
  -  [neutron-plugin-midonet](/salt/neutron-plugin-midonet)
  -  [neutron-plugin-ml2](/salt/neutron-plugin-ml2)
  -  [neutron-plugin-mlnx](/salt/neutron-plugin-mlnx)
  -  [neutron-plugin-nec](/salt/neutron-plugin-nec)
  -  [neutron-plugin-nec-agent](/salt/neutron-plugin-nec-agent)
  -  [neutron-plugin-oneconvergence](/salt/neutron-plugin-oneconvergence)
  -  [neutron-plugin-oneconvergence-agent](/salt/neutron-plugin-oneconvergence-agent)
  -  [neutron-plugin-openflow-agent](/salt/neutron-plugin-openflow-agent)
  -  [neutron-plugin-openvswitch](/salt/neutron-plugin-openvswitch)
  -  [neutron-plugin-openvswitch-agent](/salt/neutron-plugin-openvswitch-agent)
  -  [neutron-plugin-plumgrid](/salt/neutron-plugin-plumgrid)
  -  [neutron-plugin-ryu](/salt/neutron-plugin-ryu)
  -  [neutron-plugin-ryu-agent](/salt/neutron-plugin-ryu-agent)
  -  [neutron-plugin-vmware](/salt/neutron-plugin-vmware)
  -  [neutron-server](/salt/neutron-server)
  -  [neutron-vpn-agent](/salt/neutron-vpn-agent)

## Relates:

  -  [keystone](/salt/keystone)
  -  [mariadb-server](/salt/mariadb-server)
  -  [memcached](/salt/memcached)
  -  [mysql-server](/salt/mysql-server)
  -  [nova-api](/salt/nova-api)
  -  [postgresql](/salt/postgresql)
  -  [qpidd](/salt/qpidd)
  -  [rabbitmq-server](/salt/rabbitmq-server)
  -  [redis-server](/salt/redis-server)

## Files:

```bash
.
├── depend-sudo.sls
├── etc
│   └── neutron
│       ├── api-paste.ini
│       ├── fwaas_driver.ini
│       ├── l3_agent.ini
│       ├── neutron.conf
│       ├── policy.json
│       ├── rootwrap.conf
│       ├── rootwrap.d
│       │   ├── debug.filters
│       │   ├── iptables-firewall.filters
│       │   ├── l3.filters
│       │   └── vpnaas.filters
│       └── vpn_agent.ini
├── init.sls
├── relate-keystone.sls
├── relate-mariadb-server.sls
├── relate-memcached.sls
├── relate-mysql-server.sls
├── relate-nova-api.sls
├── relate-postgresql.sls
├── relate-qpidd.sls
├── relate-rabbitmq-server.sls
└── relate-redis-server.sls
```
