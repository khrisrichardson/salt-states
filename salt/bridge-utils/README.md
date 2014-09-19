# bridge-utils

## Description:

This package contains utilities for configuring the Linux Ethernet bridge in Linux. The Linux Ethernet bridge can be used for connecting multiple Ethernet devices together. The connecting is fully transparent: hosts connected to one Ethernet device see hosts connected to the other Ethernet devices directly.

## Depends:

  -  N/A

## Reverse Depends:

  -  [libvirt-bin](salt/libvirt-bin)
  -  [neutron-plugin-linuxbridge-agent](salt/neutron-plugin-linuxbridge-agent)
  -  [nova-network](salt/nova-network)

## Relates:

  -  N/A

## Files:

```bash
.
├── etc
│   └── default
│       └── bridge-utils
└── init.sls

2 directories, 2 files
```
