# kubernetes-kubelet

## Description:



## Depends:

  -  [kubernetes] (salt/kubernetes)
  -  [sensu-client] (salt/sensu-client)
  -  [supervisor] (salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [etcd] (salt/etcd)
  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── default
│   │   └── kubernetes-kubelet
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-kubernetes-kubelet.json
│   └── supervisor
│       └── conf.d
│           └── kubernetes-kubelet.conf
├── init.sls
├── relate-etcd.sls
└── relate-sensu-api.sls

7 directories, 9 files
```
