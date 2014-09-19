# sensu-api

## Description:



## Depends:

  -  [sensu-client](salt/sensu-client)
  -  [sensu-server](salt/sensu-server)

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-sensu-api.json
│   └── systemd
│       └── system
│           └── sensu-api.service
├── init.sls
└── relate-sensu-api.sls

6 directories, 6 files
```
