# sudo

## Description:

Sudo is a program designed to allow a sysadmin to give limited root privileges to users and log root activity.  The basic philosophy is to give as few privileges as possible but still allow people to get their work done.

This version is built with minimal shared library dependencies, use the sudo-ldap package instead if you need LDAP support for sudoers.

## Depends:

  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  [ceph](salt/ceph)
  -  [cinder-common](salt/cinder-common)
  -  [hadoop-hdfs-namenode](salt/hadoop-hdfs-namenode)
  -  [influxdb](salt/influxdb)
  -  [ironic-common](salt/ironic-common)
  -  [neutron-common](salt/neutron-common)
  -  [nova-common](salt/nova-common)

## Relates:

  -  [sensu-api](salt/sensu-api)

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

3 directories, 4 files
```
