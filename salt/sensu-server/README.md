# sensu-server

## Description:



## Depends:

  -  [ruby-rest-client](/salt/ruby-rest-client)
  -  [sensu](/salt/sensu)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [sensu-api](/salt/sensu-api)
  -  [sensu-dashboard](/salt/sensu-dashboard)

## Relates:

  -  [graphite-carbon](/salt/graphite-carbon)
  -  [influxdb](/salt/influxdb)
  -  [rabbitmq-server](/salt/rabbitmq-server)
  -  [redis-server](/salt/redis-server)
  -  [sensu-api](/salt/sensu-api)
  -  [sensu-dashboard](/salt/sensu-dashboard)

## Files:

```bash
.
├── etc
│   └── sensu
│       └── conf.d
│           ├── checks-sensu-server.json
│           ├── graphite-carbon.json
│           ├── handlers.json
│           ├── influxdb.json
│           ├── rabbitmq-server.json
│           ├── redis-server.json
│           ├── sensu-api.json
│           └── sensu-dashboard.json
├── init.sls
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
├── relate-rabbitmq-server.sls
├── relate-redis-server.sls
├── relate-sensu-api.sls
└── relate-sensu-dashboard.sls

3 directories, 15 files
```
