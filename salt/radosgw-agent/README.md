# radosgw-agent

## Depends:

  -  [ceph](/salt/ceph)
  -  [logstash](/salt/logstash)
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
│   ├── ceph
│   │   └── radosgw-agent
│   │       └── default.conf
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-radosgw-agent.conf
│   └── sensu
│       └── conf.d
│           └── checks-radosgw-agent.json
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
