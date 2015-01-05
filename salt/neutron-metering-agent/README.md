# neutron-metering-agent

## Description:

Neutron is a virtual network service for Openstack, and a part of Netstack. Just like OpenStack Nova provides an API to dynamically request and configure virtual servers, Neutron provides an API to dynamically request and configure virtual networks. These networks connect "interfaces" from other OpenStack services (e.g., virtual NICs from Nova VMs). The Neutron API supports extensions to provide advanced network capabilities (e.g., QoS, ACLs, network monitoring, etc.)

This package provides the metering agent.

## Depends:

  -  [neutron-common](/salt/neutron-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── etc
│   ├── neutron
│   │   └── metering_agent.ini
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-metering-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-metering-agent.conf
├── init.sls
└── relate-sensu-api.sls
```
