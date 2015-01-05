# ceph-osd

## Description:



## Depends:

  -  [btrfs-tools](/salt/btrfs-tools)
  -  [ceph](/salt/ceph)
  -  [parted](/salt/parted)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [ceph-deploy](/salt/ceph-deploy)
  -  [ceph-mon](/salt/ceph-mon)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-btrfs-tools.sls
├── depend-mount.sls
├── depend-parted.sls
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-ceph-osd.json
│   └── systemd
│       └── system
│           └── ceph-osd.service
├── init.sls
├── relate-ceph-deploy.sls
├── relate-ceph-mon.sls
└── relate-sensu-api.sls
```
