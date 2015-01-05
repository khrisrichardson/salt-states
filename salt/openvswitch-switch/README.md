# openvswitch-switch

## Description:

Open vSwitch is a production quality, multilayer, software-based, Ethernet virtual switch. It is designed to enable massive network automation through programmatic extension, while still supporting standard management interfaces and protocols (e.g. NetFlow, IPFIX, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag). In addition, it is designed to support distribution across multiple physical servers similar to VMware's vNetwork distributed vswitch or Cisco's Nexus 1000V.

openvswitch-switch provides the userspace components and utilities for the Open vSwitch kernel-based switch.

## Depends:

  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [neutron-plugin-openvswitch-agent](/salt/neutron-plugin-openvswitch-agent)

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-openvswitch-switch.conf
│   └── sensu
│       └── conf.d
│           └── checks-openvswitch-switch.json
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
