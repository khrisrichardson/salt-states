# kube-scheduler

## Depends:

  -  [kubernetes](/salt/kubernetes)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [kube-apiserver](/salt/kube-apiserver)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── default
│   │   └── kube-scheduler
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-kube-scheduler.json
│   └── supervisor
│       └── conf.d
│           └── kube-scheduler.conf
├── init.sls
├── relate-kube-apiserver.sls
└── relate-sensu-api.sls
```
