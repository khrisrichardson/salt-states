# ntp

## Depends:

  -  [collectd](/salt/collectd)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [graphite-carbon](/salt/graphite-carbon)
  -  [influxdb](/salt/influxdb)
  -  [nova-scheduler](/salt/nova-scheduler)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── collectd.d
│   │   └── input-ntp.conf
│   ├── ntp.conf
│   └── sensu
│       └── conf.d
│           └── checks-ntp.json
├── init.sls
├── map.jinja
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
├── relate-nova-scheduler.sls
└── relate-sensu-api.sls
```
