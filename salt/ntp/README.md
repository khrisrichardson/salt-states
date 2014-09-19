# ntp

## Description:

NTP, the Network Time Protocol, is used to keep computer clocks accurate by synchronizing them over the Internet or a local network, or by following an accurate hardware receiver that interprets GPS, DCF-77, NIST or similar time signals.

This package contains the NTP daemon and utility programs.  An NTP daemon needs to be running on each host that is to have its clock accuracy controlled by NTP.  The same NTP daemon is also used to provide NTP service to other hosts.

For more information about the NTP protocol and NTP server configuration and operation, install the package "ntp-doc".

## Depends:

  -  [collectd](salt/collectd)
  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [graphite-carbon](salt/graphite-carbon)
  -  [influxdb](salt/influxdb)
  -  [nova-scheduler](salt/nova-scheduler)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── collectd.d
│   │   └── ntp.conf
│   ├── ntp.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-ntp.json
│   └── systemd
│       └── system
│           └── ntp.service
├── init.sls
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
├── relate-nova-scheduler.sls
└── relate-sensu-api.sls

7 directories, 11 files
```
