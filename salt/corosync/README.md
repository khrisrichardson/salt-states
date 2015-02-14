# corosync

## Depends:

  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-dbus.sls
├── etc
│   ├── corosync
│   │   └── corosync.conf
│   ├── dbus-1
│   │   └── system.d
│   │       └── corosync-signals.conf
│   ├── default
│   │   ├── corosync
│   │   └── corosync-notifyd
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-corosync.conf
│   └── sensu
│       └── conf.d
│           └── checks-corosync.json
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
