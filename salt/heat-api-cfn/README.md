# heat-api-cfn

## Depends:

  -  [heat-common](/salt/heat-common)
  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

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
│   │       └── input-file-heat-api-cfn.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-heat-api-cfn.json
│   └── supervisor
│       └── conf.d
│           └── heat-api-cfn.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
