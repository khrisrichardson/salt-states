# nova-cert

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

OpenStack Compute, codenamed Nova, is a cloud computing fabric controller. In addition to its "native" API (the OpenStack API), it also supports the Amazon EC2 API.

Nova is intended to be modular and easy to extend and adapt. It supports many different hypervisors (KVM and Xen to name a few), different database backends (SQLite, MySQL, and PostgreSQL, for instance), different types of user databases (LDAP or SQL), etc.

This is the Nova certificate management component.

## Depends:

  -  [logstash] (salt/logstash)
  -  [nova-common] (salt/nova-common)
  -  [sensu-client] (salt/sensu-client)
  -  [supervisor] (salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash] (salt/logstash)
  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-nova-cert.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nova-cert.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── nova-cert.conf
│   └── systemd
│       └── system
│           └── nova-cert.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls

10 directories, 10 files
```
