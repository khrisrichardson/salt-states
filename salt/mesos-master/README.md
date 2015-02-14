# mesos-master

## Depends:

  -  [mesos](/salt/mesos)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [mesos-master](/salt/mesos-master)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── mesos-master
│   │   └── quorum
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-mesos-master.json
│   └── supervisor
│       └── conf.d
│           └── mesos-master.conf
├── init.sls
├── relate-mesos-master.sls
└── relate-sensu-api.sls
```
