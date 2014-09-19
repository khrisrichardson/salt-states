# tgt

## Description:

The Linux target framework (tgt) allows a Linux system to provide SCSI devices (targets) over networked SCSI transports.

Tgt consists of kernel modules, user-space daemon, and user-space This package contains the user-space daemon and tools; a recent Linux kernel is required for the modules.

This package includes drivers for:

- FCoE (Fibre Channel over Ethernet)
- iSCSI (SCSI over IP)
- iSER (iSCSI over RDMA, using Infiniband)

## Depends:

  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  [cinder-volume](salt/cinder-volume)

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-tgt.json
│   └── tgt
│       └── targets.conf
├── init.sls
└── relate-sensu-api.sls

4 directories, 4 files
```
