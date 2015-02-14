# kubernetes-proxy

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
│   │   └── kubernetes-proxy
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-kubernetes-proxy.json
│   └── supervisor
│       └── conf.d
│           └── kubernetes-proxy.conf
├── init.sls
├── relate-etcd.sls
└── relate-sensu-api.sls
```
