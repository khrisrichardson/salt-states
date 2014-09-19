# cadvisor

## Description:



## Depends:

  -  [ca-certificates](salt/ca-certificates)
  -  [gcc](salt/gcc)
  -  [git](salt/git)
  -  [golang-go](salt/golang-go)
  -  [gomock](salt/gomock)
  -  [libc6-dev](salt/libc6-dev)
  -  [mercurial](salt/mercurial)
  -  [sensu-client](salt/sensu-client)
  -  [supervisor](salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [influxdb](salt/influxdb)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── depend-golang-go.sls
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-cadvisor.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── cadvisor.conf
│   └── systemd
│       └── system
│           └── cadvisor.service
├── init.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls

8 directories, 10 files
```
