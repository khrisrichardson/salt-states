# collectd

## Depends:

  -  [logrotate](/salt/logrotate)
  -  [rpmforge-release](/salt/rpmforge-release)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [nginx-common](/salt/nginx-common)
  -  [ntp](/salt/ntp)

## Relates:

  -  [graphite-carbon](/salt/graphite-carbon)
  -  [influxdb](/salt/influxdb)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-logrotate.sls
├── etc
│   ├── collectd
│   │   └── collectd.conf
│   ├── collectd.d
│   │   ├── input-contextswitch.conf
│   │   ├── input-cpu.conf
│   │   ├── input-df.conf
│   │   ├── input-disk.conf
│   │   ├── input-entropy.conf
│   │   ├── input-interface.conf
│   │   ├── input-irq.conf
│   │   ├── input-load.conf
│   │   ├── input-memory.conf
│   │   ├── input-processes.conf
│   │   ├── input-protocols.conf
│   │   ├── input-swap.conf
│   │   ├── input-tcpconns.conf
│   │   ├── input-vmem.conf
│   │   └── output-graphite-carbon.conf
│   ├── logrotate.d
│   │   └── collectd
│   └── sensu
│       └── conf.d
│           └── checks-collectd.json
├── init.sls
├── map.jinja
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls
```
