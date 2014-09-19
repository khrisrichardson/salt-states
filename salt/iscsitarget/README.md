# iscsitarget

## Description:

iSCSI Enterprise Target is for building an iSCSI storage system on Linux. It is aimed at developing an iSCSI target satisfying enterprise requirements.

This package contains the userland part; you require the kernel module for proper operation.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [cinder-volume](/salt/cinder-volume)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── default
│   │   └── iscsitarget
│   └── sensu
│       └── conf.d
│           └── checks-iscsitarget.json
├── init.sls
└── relate-sensu-api.sls

4 directories, 4 files
```
