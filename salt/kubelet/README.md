# kubelet

## Depends:

  -  [kubernetes](/salt/kubernetes)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [etcd](/salt/etcd)
  -  [kube-apiserver](/salt/kube-apiserver)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── default
│   │   └── kubelet
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-kubelet.json
│   └── supervisor
│       └── conf.d
│           └── kubelet.conf
├── init.sls
├── relate-etcd.sls
├── relate-kube-apiserver.sls
└── relate-sensu-api.sls
```
