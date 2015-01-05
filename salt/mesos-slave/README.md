# mesos-slave

## Description:



## Depends:

  -  [mesos](/salt/mesos)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-mesos-slave.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── mesos-slave.conf
│   └── systemd
│       └── system
│           └── mesos-slave.service
├── init.sls
└── relate-sensu-api.sls
```
