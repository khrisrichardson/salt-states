# kubernetes-apiserver

## Description:



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
  -  [kubernetes-kubelet](/salt/kubernetes-kubelet)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-nginx.sls
├── depend-openssl.sls
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── default
│   │   └── kubernetes-apiserver
│   ├── nginx
│   │   └── sites-available
│   │       └── kubernetes-apiserver
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-kubernetes-apiserver.json
│   └── supervisor
│       └── conf.d
│           └── kubernetes-apiserver.conf
├── init.sls
├── relate-etcd.sls
├── relate-kubernetes-kubelet.sls
└── relate-sensu-api.sls

9 directories, 13 files
```
