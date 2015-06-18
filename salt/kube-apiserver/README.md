# kube-apiserver

## Depends:

  -  [kubernetes](/salt/kubernetes)
  -  [nginx](/salt/nginx)
  -  [python-openssl](/salt/python-openssl)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [etcd](/salt/etcd)
  -  [kubelet](/salt/kubelet)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-nginx.sls
├── depend-openssl.sls
├── depend-supervisor.sls
├── etc
│   ├── default
│   │   └── kube-apiserver
│   ├── nginx
│   │   └── sites-available
│   │       └── kube-apiserver
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-kube-apiserver.json
│   └── supervisor
│       └── conf.d
│           └── kube-apiserver.conf
├── init.sls
├── relate-etcd.sls
├── relate-kubelet.sls
└── relate-sensu-api.sls
```
