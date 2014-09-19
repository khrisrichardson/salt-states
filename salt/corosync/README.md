# corosync

## Description:

The corosync project is a project to implement a production quality "Revised BSD" licensed implementation of all core functionalities required by openais. The project implements cutting edge research on virtual synchrony to provide 100% correct operation in the face of failures or partitionable networks with excellent performance characteristics.

The Application Interface Specification is a software API and policies which are used to develop applications that maintain service during faults.

This package contains the corosync daemon and modules.

## Depends:

  -  [logstash](salt/logstash)
  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](salt/logstash)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
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

9 directories, 10 files
```
