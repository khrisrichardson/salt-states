# ceilometer-agent-compute

## Depends:

  -  [ceilometer-common](/salt/ceilometer-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  [nova-compute-docker](/salt/nova-compute-docker)
  -  [nova-compute-lxc](/salt/nova-compute-lxc)

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
│   │       └── checks-ceilometer-agent-compute.json
│   └── supervisor
│       └── conf.d
│           └── ceilometer-agent-compute.conf
├── init.sls
└── relate-sensu-api.sls
```
