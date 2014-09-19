# smartmontools

## Description:

The smartmontools package contains two utility programs (smartctl and smartd) to control and monitor storage systems using the Self-Monitoring, Analysis and Reporting Technology System (S.M.A.R.T.) built into most modern ATA and SCSI hard disks. It is derived from the smartsuite package, and includes support for ATA/ATAPI-5 disks. It should run on any modern Linux system.

## Depends:

  -  [sensu-client] (salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-smartmontools.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 3 files
```
