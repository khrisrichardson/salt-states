# cron

## Depends:

  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  [hbase](/salt/hbase)

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
│   │       └── checks-cron.json
│   └── supervisor
│       └── conf.d
│           └── cron.conf
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
