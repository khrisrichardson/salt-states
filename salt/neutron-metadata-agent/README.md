# neutron-metadata-agent

## Description:

Neutron is a virtual network service for Openstack, and a part of Netstack. Just like OpenStack Nova provides an API to dynamically request and configure virtual servers, Neutron provides an API to dynamically request and configure virtual networks. These networks connect "interfaces" from other OpenStack services (e.g., virtual NICs from Nova VMs). The Neutron API supports extensions to provide advanced network capabilities (e.g., QoS, ACLs, network monitoring, etc.)

This package provides the metadata proxy agent.

## Depends:

  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  [neutron-dhcp-agent](/salt/neutron-dhcp-agent)
  -  [neutron-l3-agent](/salt/neutron-l3-agent)
  -  [neutron-vpn-agent](/salt/neutron-vpn-agent)

## Relates:

  -  [keystone](/salt/keystone)
  -  [logstash](/salt/logstash)
  -  [nova-api-metadata](/salt/nova-api-metadata)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-neutron-metadata-agent.conf
│   ├── neutron
│   │   └── metadata_agent.ini
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-metadata-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-metadata-agent.conf
├── init.sls
├── relate-keystone.sls
├── relate-logstash.sls
├── relate-nova-api-metadata.sls
└── relate-sensu-api.sls
```
