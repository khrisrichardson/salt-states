# nova-cert

## Depends:

  -  [logstash](/salt/logstash)
  -  [nova-common](/salt/nova-common)
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
│   │       └── input-file-nova-cert.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nova-cert.json
│   └── supervisor
│       └── conf.d
│           └── nova-cert.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
