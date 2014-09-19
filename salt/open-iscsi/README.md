# open-iscsi

## Description:

Open-iSCSI is a high-performance, transport independent, multi-platform implementation of RFC3720 iSCSI

Open-iSCSI is partitioned into user and kernel parts where the kernel portion implements iSCSI data path (i.e. iSCSI Read and iSCSI Write) The userspace contains the entire control plane consisting of:
* Configuration Manager
* iSCSI Discovery, Login and Logout processing
* Connection level error processing
* Nop-In and Nop-Out handling
* Text processing, iSNS, SLP, Radius et cetera (future)
The userspace component consists of a daemon, iscsid and a management utility, iscsiadm

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
│   │   └── open-iscsi
│   ├── iscsi
│   │   └── iscsid.conf
│   └── sensu
│       └── conf.d
│           └── checks-open-iscsi.json
├── init.sls
└── relate-sensu-api.sls

5 directories, 5 files
```
