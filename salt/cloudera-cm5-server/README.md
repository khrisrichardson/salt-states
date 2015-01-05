# cloudera-cm5-server

## Description:

The Cloudera Manager Server manages the services making up a Hadoop cluster.

## Depends:

  -  [cloudera-cm5-agent](/salt/cloudera-cm5-agent)
  -  [cloudera-cm5-daemons](/salt/cloudera-cm5-daemons)
  -  [cloudera-cm5-server-db-2](/salt/cloudera-cm5-server-db-2)
  -  [oracle-j2sdk1\_7](/salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer](/salt/oracle-java7-installer)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-cloudera-cm5-server.json
│   └── systemd
│       └── system
│           └── cloudera-cm5-server.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
