# flannel

## Depends:

  -  [git](/salt/git)
  -  [golang-go](/salt/golang-go)
  -  [linux-libc-dev](/salt/linux-libc-dev)
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
├── depend-git.sls
├── depend-golang-go.sls
├── depend-supervisor.sls
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-flannel.json
│   └── supervisor
│       └── conf.d
│           └── flannel.conf
├── init.sls
├── relate-etcd.sls
└── relate-sensu-api.sls
```
