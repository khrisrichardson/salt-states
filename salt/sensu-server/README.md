# sensu-server

## Depends:

  -  [ruby-rest-client](/salt/ruby-rest-client)
  -  [sensu](/salt/sensu)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [sensu-api](/salt/sensu-api)
  -  [sensu-dashboard](/salt/sensu-dashboard)

## Relates:

  -  [flapjack](/salt/flapjack)
  -  [graphite-carbon](/salt/graphite-carbon)
  -  [influxdb](/salt/influxdb)
  -  [logstash](/salt/logstash)
  -  [opentsdb](/salt/opentsdb)
  -  [rabbitmq-server](/salt/rabbitmq-server)
  -  [redis-server](/salt/redis-server)
  -  [sensu-api](/salt/sensu-api)
  -  [sensu-dashboard](/salt/sensu-dashboard)

## Files:

```bash
.
├── defaults.yaml
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
├── relate-flapjack.sls
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
├── relate-logstash.sls
├── relate-opentsdb.sls
├── relate-rabbitmq-server.sls
├── relate-redis-server.sls
├── relate-sensu-api.sls
└── relate-sensu-dashboard.sls
```
