# openvswitch-ipsec

## Description:

Open vSwitch is a production quality, multilayer, software-based, Ethernet virtual switch. It is designed to enable massive network automation through programmatic extension, while still supporting standard management interfaces and protocols (e.g. NetFlow, IPFIX, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag). In addition, it is designed to support distribution across multiple physical servers similar to VMware's vNetwork distributed vswitch or Cisco's Nexus 1000V.

The ovs-monitor-ipsec script provides support for encrypting GRE tunnels with IPsec.

## Depends:

  -  [racoon](salt/racoon)
  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-openvswitch-ipsec.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 3 files
```
