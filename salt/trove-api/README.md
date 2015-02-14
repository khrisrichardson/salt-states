# trove-api

## Depends:

  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)
  -  [trove-common](/salt/trove-common)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-trove-api.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-trove-api.json
│   └── supervisor
│       └── conf.d
│           └── trove-api.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
