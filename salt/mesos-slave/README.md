# mesos-slave

## Depends:

  -  [mesos](/salt/mesos)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [mesos-dns](/salt/mesos-dns)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── mesos-slave
│   │   ├── containerizers
│   │   └── executor_registration_timeout
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-mesos-slave.json
│   └── supervisor
│       └── conf.d
│           └── mesos-slave.conf
├── init.sls
├── relate-mesos-dns.sls
└── relate-sensu-api.sls
```
