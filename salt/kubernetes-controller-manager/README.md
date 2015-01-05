# kubernetes-controller-manager

## Description:



## Depends:

  -  [kubernetes](/salt/kubernetes)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [etcd](/salt/etcd)
  -  [kubernetes-apiserver](/salt/kubernetes-apiserver)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── default
│   │   └── kubernetes-controller-manager
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-kubernetes-controller-manager.json
│   └── supervisor
│       └── conf.d
│           └── kubernetes-controller-manager.conf
├── init.sls
├── relate-etcd.sls
├── relate-kubernetes-apiserver.sls
└── relate-sensu-api.sls
```
