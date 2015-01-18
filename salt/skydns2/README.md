# skydns2

## Description:



## Depends:

  -  [ca-certificates](/salt/ca-certificates)
  -  [git](/salt/git)
  -  [golang-go](/salt/golang-go)
  -  [mercurial](/salt/mercurial)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [etcd](/salt/etcd)
  -  [graphite-carbon](/salt/graphite-carbon)
  -  [influxdb](/salt/influxdb)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-golang-go.sls
├── depend-supervisor.sls
├── etc
│   ├── profile.d
│   │   └── skydns2.sh
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-skydns2.json
│   └── supervisor
│       └── conf.d
│           └── skydns2.conf
├── init.sls
├── relate-etcd.sls
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls
```
