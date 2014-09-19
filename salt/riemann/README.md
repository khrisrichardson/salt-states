# riemann

## Description:



## Depends:

  -  [openjdk-7-jre-headless] (salt/openjdk-7-jre-headless)
  -  [sensu-client] (salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── riemann
│   │   └── riemann.config
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-riemann.json
│   └── systemd
│       └── system
│           └── riemann.service
├── init.sls
└── relate-sensu-api.sls

7 directories, 7 files
```
