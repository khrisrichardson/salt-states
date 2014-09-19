# nova-baremetal

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

OpenStack Compute, codenamed Nova, is a cloud computing fabric controller. In addition to its "native" API (the OpenStack API), it also supports the Amazon EC2 API.

Nova is intended to be modular and easy to extend and adapt. It supports many different hypervisors (KVM and Xen to name a few), different database backends (SQLite, MySQL, and PostgreSQL, for instance), different types of user databases (LDAP or SQL), etc.

This is the baremetal virt component.

## Depends:

  -  [logstash](salt/logstash)
  -  [nova-common](salt/nova-common)
  -  [sensu-client](salt/sensu-client)
  -  [supervisor](salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](salt/logstash)
  -  [mariadb-server](salt/mariadb-server)
  -  [mysql-server](salt/mysql-server)
  -  [postgresql](salt/postgresql)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-nova-baremetal.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nova-baremetal.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── nova-baremetal.conf
│   └── systemd
│       └── system
│           └── nova-baremetal.service
├── init.sls
├── relate-logstash.sls
├── relate-mariadb-server.sls
├── relate-mysql-server.sls
├── relate-postgresql.sls
└── relate-sensu-api.sls

10 directories, 13 files
```
