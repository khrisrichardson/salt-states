# ceilometer-api

## Depends:

  -  [ceilometer-common](/salt/ceilometer-common)
  -  [haproxy](/salt/haproxy)
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
├── depend-haproxy.sls
├── depend-supervisor.sls
├── etc
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-ceilometer-api.json
│   └── supervisor
│       └── conf.d
│           └── ceilometer-api.conf
├── init.sls
└── relate-sensu-api.sls
```
