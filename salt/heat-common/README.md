# heat-common

## Description:

Heat is a service to orchestrate multiple composite cloud applications using templates, through both an OpenStack-native ReST API and a CloudFormation-compatible Query API.

This package contains the common files.

## Depends:

  -  N/A

## Reverse Depends:

  -  [heat-api](salt/heat-api)
  -  [heat-api-cfn](salt/heat-api-cfn)
  -  [heat-api-cloudwatch](salt/heat-api-cloudwatch)
  -  [heat-engine](salt/heat-engine)

## Relates:

  -  [keystone](salt/keystone)
  -  [mariadb-server](salt/mariadb-server)
  -  [memcached](salt/memcached)
  -  [mysql-server](salt/mysql-server)
  -  [postgresql](salt/postgresql)
  -  [qpidd](salt/qpidd)
  -  [rabbitmq-server](salt/rabbitmq-server)
  -  [redis-server](salt/redis-server)

## Files:

```bash
.
├── etc
│   └── heat
│       ├── api-paste.ini
│       ├── heat.conf
│       └── policy.json
├── init.sls
├── relate-keystone.sls
├── relate-mariadb-server.sls
├── relate-memcached.sls
├── relate-mysql-server.sls
├── relate-postgresql.sls
├── relate-qpidd.sls
├── relate-rabbitmq-server.sls
└── relate-redis-server.sls

2 directories, 12 files
```
