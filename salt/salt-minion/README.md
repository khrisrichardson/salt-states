# salt-minion

## Depends:

  -  [apt](/salt/apt)
  -  [epel-release](/salt/epel-release)
  -  [git](/salt/git)
  -  [incron](/salt/incron)
  -  [openssh-client.known\_hosts.github.com](/salt/openssh-client/known_hosts/github/com.sls)
  -  [python-elasticsearch](/salt/python-elasticsearch)
  -  [python-etcd](/salt/python-etcd)
  -  [python-influxdb](/salt/python-influxdb)
  -  [python-memcache](/salt/python-memcache)
  -  [python-mysqldb](/salt/python-mysqldb)
  -  [python-psutil](/salt/python-psutil)
  -  [python-psycopg2](/salt/python-psycopg2)
  -  [python-pygit2](/salt/python-pygit2)
  -  [python-pymongo](/salt/python-pymongo)
  -  [python-redis](/salt/python-redis)
  -  [salt-common](/salt/salt-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [apt-cacher-ng](/salt/apt-cacher-ng)
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
  -  [salt-master](/salt/salt-master)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── bootstrap.sh
├── defaults.yaml
├── depend-git.sls
├── depend-incron.sls
├── depend-supervisor.sls
├── etc
│   ├── salt
│   │   └── minion.d
│   │       ├── elasticsearch.conf
│   │       ├── etcd.conf
│   │       ├── fileserver_backend.conf
│   │       ├── graphite-carbon.conf
│   │       ├── influxdb.conf
│   │       ├── log.conf
│   │       ├── memcached.conf
│   │       ├── mine.conf
│   │       ├── mongodb-server.conf
│   │       ├── mysql-server.conf
│   │       ├── postgresql.conf
│   │       ├── redis-server.conf
│   │       ├── salt-master.conf
│   │       └── schedule.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-salt-minion.json
│   └── supervisor
│       └── conf.d
│           └── salt-minion.conf
├── init.sls
├── relate-apt-cacher-ng.sls
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
├── relate-salt-master.sls
└── relate-sensu-api.sls
```
