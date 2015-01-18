# etcd

## Description:



## Depends:

  -  [ca-certificates](/salt/ca-certificates)
  -  [etcd-common](/salt/etcd-common)
  -  [git](/salt/git)
  -  [golang-go](/salt/golang-go)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-golang-go.sls
├── depend-supervisor.sls
├── etc
│   ├── etcd
│   │   ├── etcd.conf
│   │   └── peer.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-etcd.json
│   └── supervisor
│       └── conf.d
│           └── etcd.conf
├── init.sls
├── relate-etcd.sls
└── relate-sensu-api.sls
```
