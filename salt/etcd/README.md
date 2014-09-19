# etcd

## Description:



## Depends:

  -  [ca-certificates](salt/ca-certificates)
  -  [etcd-common](salt/etcd-common)
  -  [git](salt/git)
  -  [golang-go](salt/golang-go)
  -  [sensu-client](salt/sensu-client)
  -  [supervisor](salt/supervisor)

## Reverse Depends:

  -  [coreos-fleet](salt/coreos-fleet)

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── depend-golang-go.sls
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── etcd
│   │   ├── etcd.conf
│   │   └── peer.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-etcd.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── etcd.conf
│   └── systemd
│       └── system
│           └── etcd.service
├── init.sls
└── relate-sensu-api.sls

9 directories, 11 files
```
