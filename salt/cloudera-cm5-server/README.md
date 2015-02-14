# cloudera-cm5-server

## Depends:

  -  [cloudera-cm5](/salt/cloudera-cm5)
  -  [cloudera-cm5-agent](/salt/cloudera-cm5-agent)
  -  [cloudera-cm5-daemons](/salt/cloudera-cm5-daemons)
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
│   └── sensu
│       └── conf.d
│           └── checks-cloudera-cm5-server.json
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
