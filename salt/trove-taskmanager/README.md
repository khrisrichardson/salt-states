# trove-taskmanager

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
│   │       └── input-file-trove-taskmanager.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-trove-taskmanager.json
│   └── supervisor
│       └── conf.d
│           └── trove-taskmanager.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
