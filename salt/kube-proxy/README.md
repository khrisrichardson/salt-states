# kube-proxy

## Depends:

  -  [kubernetes](/salt/kubernetes)
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
├── depend-supervisor.sls
├── etc
│   ├── default
│   │   └── kube-proxy
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-kube-proxy.json
│   └── supervisor
│       └── conf.d
│           └── kube-proxy.conf
├── init.sls
├── relate-etcd.sls
└── relate-sensu-api.sls
```
