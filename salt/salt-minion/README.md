# salt-minion

## Description:

salt is a powerful remote execution manager that can be used to administer servers in a fast and efficient way.

It allows commands to be executed across large groups of servers. This means systems can be easily managed, but data can also be easily gathered.  Quick introspection into running systems becomes a reality.

Remote execution is usually used to set up a certain state on a remote system. Salt addresses this problem as well, the salt state system uses salt state files to define the state a server needs to be in.

Between the remote execution system, and state management Salt addresses the backbone of cloud and data center management.

This particular package provides the worker / agent for salt.

## Depends:

  -  [epel-release](/salt/epel-release)
  -  [incron](/salt/incron)
  -  [python-elasticsearch](/salt/python-elasticsearch)
  -  [python-etcd](/salt/python-etcd)
  -  [python-influxdb](/salt/python-influxdb)
  -  [python-memcache](/salt/python-memcache)
  -  [python-mysqldb](/salt/python-mysqldb)
  -  [python-psutil](/salt/python-psutil)
  -  [python-psycopg2](/salt/python-psycopg2)
  -  [python-pymongo](/salt/python-pymongo)
  -  [python-redis](/salt/python-redis)
  -  [salt-common](/salt/salt-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [elasticsearch](/salt/elasticsearch)
  -  [etcd](/salt/etcd)
  -  [graphite-carbon](/salt/graphite-carbon)
  -  [influxdb](/salt/influxdb)
  -  [logstash](/salt/logstash)
  -  [memcached](/salt/memcached)
  -  [mongodb-server](/salt/mongodb-server)
  -  [mysql-server](/salt/mysql-server)
  -  [postgresql](/salt/postgresql)
  -  [redis-server](/salt/redis-server)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── bootstrap.sh
├── depend-incron.sls
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── salt
│   │   └── minion.d
│   │       ├── elasticsearch.conf
│   │       ├── etcd.conf
│   │       ├── graphite-carbon.conf
│   │       ├── influxdb.conf
│   │       ├── log.conf
│   │       ├── master.conf
│   │       ├── memcached.conf
│   │       ├── mongodb-server.conf
│   │       ├── mysql-server.conf
│   │       ├── postgresql.conf
│   │       ├── redis-server.conf
│   │       └── schedule.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-salt-minion.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── salt-minion.conf
│   └── systemd
│       └── system
│           └── salt-minion.service
├── init.sls
├── relate-elasticsearch.sls
├── relate-etcd.sls
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
├── relate-logstash.sls
├── relate-memcached.sls
├── relate-mongodb-server.sls
├── relate-mysql-server.sls
├── relate-postgresql.sls
├── relate-redis-server.sls
└── relate-sensu-api.sls

9 directories, 31 files
```
