# trove-guestagent

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
│   │       └── input-file-trove-guestagent.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-trove-guestagent.json
│   └── supervisor
│       └── conf.d
│           └── trove-guestagent.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
