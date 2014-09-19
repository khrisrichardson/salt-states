# mesos-slave

## Description:



## Depends:

  -  [mesos](salt/mesos)
  -  [sensu-client](salt/sensu-client)
  -  [supervisor](salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
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
├── relate-sensu-api.sls
└── salt
    └── grains

9 directories, 9 files
```
