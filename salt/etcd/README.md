# etcd

## Depends:

  -  [git](/salt/git)
  -  [golang-go](/salt/golang-go)
  -  [python-apt](/salt/python-apt)
  -  [ruby-rest-client](/salt/ruby-rest-client)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  [etcdctl](/salt/etcdctl)

## Relates:

  -  [etcd](/salt/etcd)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-git.sls
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
│       └── conf.d
│           └── etcd.conf
├── init.sls
├── relate-etcd.sls
└── relate-sensu-api.sls
```
