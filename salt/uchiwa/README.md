# uchiwa

## Description:



## Depends:

  -  [sensu](salt/sensu)
  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   ├── conf.d
│   │   │   └── checks-uchiwa.json
│   │   └── uchiwa.json
│   └── systemd
│       └── system
│           └── uchiwa.service
├── init.sls
└── relate-sensu-api.sls

6 directories, 7 files
```
