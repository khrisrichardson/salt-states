# glance-api

## Depends:

  -  [haproxy](/salt/haproxy)
  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [cinder-volume](/salt/cinder-volume)
  -  [glance-registry](/salt/glance-registry)
  -  [keystone](/salt/keystone)
  -  [logstash](/salt/logstash)
  -  [mariadb-server](/salt/mariadb-server)
  -  [memcached](/salt/memcached)
  -  [mongodb-server](/salt/mongodb-server)
  -  [mysql-server](/salt/mysql-server)
  -  [nova-objectstore](/salt/nova-objectstore)
  -  [postgresql](/salt/postgresql)
  -  [qpidd](/salt/qpidd)
  -  [rabbitmq-server](/salt/rabbitmq-server)
  -  [radosgw](/salt/radosgw)
  -  [redis-server](/salt/redis-server)
  -  [sensu-api](/salt/sensu-api)
  -  [sheepdog](/salt/sheepdog)
  -  [swift-object](/salt/swift-object)
  -  [swift-proxy](/salt/swift-proxy)

## Files:

```bash
.
├── defaults.yaml
├── depend-haproxy.sls
├── depend-supervisor.sls
├── etc
│   ├── glance
│   │   ├── glance-api-paste.ini
│   │   ├── glance-api.conf
│   │   ├── glance-cache.conf
│   │   ├── glance-scrubber.conf
│   │   ├── policy.json
│   │   └── schema-image.json
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-glance-api.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-glance-api.json
│   └── supervisor
│       └── conf.d
│           └── glance-api.conf
├── init.sls
├── relate-cinder-volume.sls
├── relate-glance-registry.sls
├── relate-keystone.sls
├── relate-logstash.sls
├── relate-mariadb-server.sls
├── relate-memcached.sls
├── relate-mongodb-server.sls
├── relate-mysql-server.sls
├── relate-nova-objectstore.sls
├── relate-postgresql.sls
├── relate-qpidd.sls
├── relate-rabbitmq-server.sls
├── relate-radosgw.sls
├── relate-redis-server.sls
├── relate-sensu-api.sls
├── relate-sheepdog.sls
├── relate-swift-object.sls
└── relate-swift-proxy.sls
```
