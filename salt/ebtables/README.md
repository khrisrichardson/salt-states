# ebtables

## Description:

Ebtables is used to set up, maintain, and inspect the tables of Ethernet frame rules in the Linux kernel. It is analogous to iptables, but operates at the MAC layer rather than the IP layer.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [nova-compute-libvirt](/salt/nova-compute-libvirt)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── default
│   │   └── ebtables
│   ├── ethertypes
│   └── sensu
│       └── conf.d
│           └── checks-ebtables.json
├── init.sls
└── relate-sensu-api.sls

4 directories, 5 files
```
