# collectd

## Description:

collectd is a small daemon which collects system information periodically and provides mechanisms to monitor and store the values in a variety of ways. Since the daemon doesn't need to startup every time it wants to update the values it's very fast and easy on the system. Also, the statistics are very fine grained since the files are updated every 10 seconds by default.

The collected information can be used to find current performance bottlenecks (performance analysis) and predict future system load (capacity planning).

This package provides a full installation of the daemon, including the configuration. For the core system, see the "collectd-core" package, which allows sites to, e.g., provide customizations (like a custom default configuration) on top of it without having to modify the "collectd" package.

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
