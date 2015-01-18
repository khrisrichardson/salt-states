# kubernetes-kubelet

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
│   │   └── kubernetes-kubelet
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-kubernetes-kubelet.json
│   └── supervisor
│       └── conf.d
│           └── kubernetes-kubelet.conf
├── init.sls
├── relate-etcd.sls
├── relate-kubernetes-apiserver.sls
└── relate-sensu-api.sls
```
