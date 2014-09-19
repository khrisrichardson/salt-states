# maas

## Description:

MAAS is "Metal As A Service", a system for dynamic provisioning of physical servers that has many of the same characteristics as a cloud.  You register servers with MAAS by telling MAAS about their IPMI or other control system. MAAS can then do hardware inventory, and provision that system on demand with whatever OS and software you like.  MAAS is standalone software that works with any configuration system, but for best results combine MAAS with Juju.

MAAS provides:
* Hardware inventory of servers
* Dynamic provisioning based on name or attributes such as disk, RAM cores, sockets
* DNS and DHCP as needed
* PXE boot services
This package is a metapackage which installs all of the separate components of MAAS on a single machine.

## Depends:

  -  N/A

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── init.sls
└── root
    └── bin
        └── maas.sh

2 directories, 2 files
```
