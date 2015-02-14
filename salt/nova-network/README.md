# nova-network

## Depends:

  -  [bridge-utils](/salt/bridge-utils)
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
│   │       └── input-file-nova-network.conf
│   ├── nova
│   │   └── rootwrap.d
│   │       └── network.filters
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nova-network.json
│   └── supervisor
│       └── conf.d
│           └── nova-network.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
