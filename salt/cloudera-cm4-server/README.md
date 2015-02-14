# cloudera-cm4-server

## Depends:

  -  [cloudera-cm4](/salt/cloudera-cm4)
  -  [cloudera-cm4-agent](/salt/cloudera-cm4-agent)
  -  [cloudera-cm4-daemons](/salt/cloudera-cm4-daemons)
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
│   └── sensu
│       └── conf.d
│           └── checks-cloudera-cm4-server.json
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
