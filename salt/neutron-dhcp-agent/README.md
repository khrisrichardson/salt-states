# neutron-dhcp-agent

## Description:

Neutron is a virtual network service for Openstack, and a part of Netstack. Just like OpenStack Nova provides an API to dynamically request and configure virtual servers, Neutron provides an API to dynamically request and configure virtual networks. These networks connect "interfaces" from other OpenStack services (e.g., virtual NICs from Nova VMs). The Neutron API supports extensions to provide advanced network capabilities (e.g., QoS, ACLs, network monitoring, etc.)

This package provides the DHCP agent.

## Depends:

  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
  -  [neutron-metadata-agent](/salt/neutron-metadata-agent)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-neutron-dhcp-agent.conf
│   ├── neutron
│   │   ├── dhcp_agent.ini
│   │   └── rootwrap.d
│   │       └── dhcp.filters
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-dhcp-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-dhcp-agent.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
