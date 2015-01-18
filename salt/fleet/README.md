# fleet

## Description:



## Depends:

  -  [ca-certificates](/salt/ca-certificates)
  -  [fleet-common](/salt/fleet-common)
  -  [git](/salt/git)
  -  [golang-go](/salt/golang-go)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [etcd](/salt/etcd)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-golang-go.sls
├── depend-supervisor.sls
├── etc
│   ├── fleet
│   │   └── fleet.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-fleet.json
│   └── supervisor
│       └── conf.d
│           └── fleet.conf
├── init.sls
├── relate-etcd.sls
└── relate-sensu-api.sls
```
