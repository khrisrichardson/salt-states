# sheepdog

## Description:

Sheepdog provides highly available block level storage volumes that can be attached to QEMU virtual machines. Sheepdog scales to several hundred nodes, and supports advanced volume management features such as snapshots, cloning, and thin provisioning.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-sheepdog.json
│   └── systemd
│       └── system
│           └── sheepdog.service
├── init.sls
└── relate-sensu-api.sls
```
