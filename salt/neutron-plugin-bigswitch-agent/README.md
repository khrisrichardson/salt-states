# neutron-plugin-bigswitch-agent

## Description:

Neutron is a virtual network service for Openstack, and a part of Netstack. Just like OpenStack Nova provides an API to dynamically request and configure virtual servers, Neutron provides an API to dynamically request and configure virtual networks. These networks connect "interfaces" from other OpenStack services (e.g., virtual NICs from Nova VMs). The Neutron API supports extensions to provide advanced network capabilities (e.g., QoS, ACLs, network monitoring, etc.)

This package provides the BigSwitch plugin agent.

## Depends:

  -  [neutron-common](/salt/neutron-common)
  -  [neutron-plugin-bigswitch](/salt/neutron-plugin-bigswitch)
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
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-plugin-bigswitch-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-plugin-bigswitch-agent.conf
├── init.sls
└── relate-sensu-api.sls
```
