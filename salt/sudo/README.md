# sudo

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [ceph](/salt/ceph)
  -  [cinder-common](/salt/cinder-common)
  -  [flynn-host](/salt/flynn-host)
  -  [hadoop-hdfs-namenode](/salt/hadoop-hdfs-namenode)
  -  [influxdb](/salt/influxdb)
  -  [ironic-common](/salt/ironic-common)
  -  [neutron-common](/salt/neutron-common)
  -  [nova-common](/salt/nova-common)
  -  [nsenter](/salt/nsenter)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-sudo.json
│   └── sudoers
├── init.sls
└── relate-sensu-api.sls
```
