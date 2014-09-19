# neutron-l3-agent

## Description:

Neutron is a virtual network service for Openstack, and a part of Netstack. Just like OpenStack Nova provides an API to dynamically request and configure virtual servers, Neutron provides an API to dynamically request and configure virtual networks. These networks connect "interfaces" from other OpenStack services (e.g., virtual NICs from Nova VMs). The Neutron API supports extensions to provide advanced network capabilities (e.g., QoS, ACLs, network monitoring, etc.)

This package provides the layer 3 routing agent.

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
│   │       └── input-file-neutron-l3-agent.conf
│   ├── neutron
│   │   └── l3_agent.ini
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-l3-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-l3-agent.conf
├── init.sls
├── relate-logstash.sls
├── relate-sensu-api.sls
└── root
    └── bin
        └── neutron-l3-agent.sh

10 directories, 9 files
```
