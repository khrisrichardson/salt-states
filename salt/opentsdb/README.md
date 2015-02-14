# opentsdb

## Depends:

  -  [openjdk-7-jre-headless](/salt/openjdk-7-jre-headless)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)
  -  [zookeeper-server](/salt/zookeeper-server)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── opentsdb
│   │   └── opentsdb.conf
│   └── sensu
│       └── conf.d
│           └── checks-opentsdb.json
├── init.sls
├── relate-sensu-api.sls
└── relate-zookeeper-server.sls
```
