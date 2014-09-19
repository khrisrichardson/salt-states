# sensu-dashboard

## Description:



## Depends:

  -  [sensu-client] (salt/sensu-client)
  -  [sensu-server] (salt/sensu-server)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-sensu-dashboard.json
│   └── systemd
│       └── system
│           └── sensu-dashboard.service
├── init.sls
└── relate-sensu-api.sls

6 directories, 6 files
```
