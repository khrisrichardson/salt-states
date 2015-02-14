# nova-api

## Depends:

  -  [haproxy](/salt/haproxy)
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
├── depend-haproxy.sls
├── depend-supervisor.sls
├── etc
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-nova-api.conf
│   ├── nova
│   │   └── rootwrap.d
│   │       └── api-metadata.filters
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nova-api.json
│   └── supervisor
│       └── conf.d
│           └── nova-api.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
