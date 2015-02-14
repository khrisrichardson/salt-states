# glance-registry

## Depends:

  -  [haproxy](/salt/haproxy)
  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [keystone](/salt/keystone)
  -  [logstash](/salt/logstash)
  -  [mariadb-server](/salt/mariadb-server)
  -  [memcached](/salt/memcached)
  -  [mysql-server](/salt/mysql-server)
  -  [postgresql](/salt/postgresql)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-haproxy.sls
├── depend-supervisor.sls
├── etc
│   ├── glance
│   │   ├── glance-registry-paste.ini
│   │   └── glance-registry.conf
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-glance-registry.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-glance-registry.json
│   └── supervisor
│       └── conf.d
│           └── glance-registry.conf
├── init.sls
├── relate-keystone.sls
├── relate-logstash.sls
├── relate-mariadb-server.sls
├── relate-memcached.sls
├── relate-mysql-server.sls
├── relate-postgresql.sls
└── relate-sensu-api.sls
```
