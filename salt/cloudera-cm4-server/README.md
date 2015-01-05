# cloudera-cm4-server

## Description:

The Cloudera Manager Server manages the services making up a Hadoop cluster.

## Depends:

  -  [cloudera-cm4-agent](/salt/cloudera-cm4-agent)
  -  [cloudera-cm4-daemons](/salt/cloudera-cm4-daemons)
  -  [cloudera-cm4-server-db](/salt/cloudera-cm4-server-db)
  -  [oracle-j2sdk1\_6](/salt/oracle-j2sdk1_6)
  -  [oracle-java6-installer](/salt/oracle-java6-installer)
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
│   │       └── checks-cloudera-cm4-server.json
│   └── systemd
│       └── system
│           └── cloudera-cm4-server.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
