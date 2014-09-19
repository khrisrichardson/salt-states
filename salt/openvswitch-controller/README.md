# openvswitch-controller

## Description:

Open vSwitch is a production quality, multilayer, software-based, Ethernet virtual switch. It is designed to enable massive network automation through programmatic extension, while still supporting standard management interfaces and protocols (e.g. NetFlow, IPFIX, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag). In addition, it is designed to support distribution across multiple physical servers similar to VMware's vNetwork distributed vswitch or Cisco's Nexus 1000V.

The Open vSwitch controller enables OpenFlow switches that connect to it to act as MAC-learning Ethernet switches.

## Depends:

  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── default
│   │   └── openvswitch-controller
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-openvswitch-controller.json
│   └── systemd
│       └── system
│           └── openvswitch-controller.service
├── init.sls
└── relate-sensu-api.sls

7 directories, 7 files
```
