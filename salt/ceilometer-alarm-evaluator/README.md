# ceilometer-alarm-evaluator

## Depends:

  -  [ceilometer-common](/salt/ceilometer-common)
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
│   │       └── checks-ceilometer-alarm-evaluator.json
│   └── supervisor
│       └── conf.d
│           └── ceilometer-alarm-evaluator.conf
├── init.sls
└── relate-sensu-api.sls
```
