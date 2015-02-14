# neutron-server

## Depends:

  -  [ifupdown](/salt/ifupdown)
  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
  -  [neutron-plugin-ml2](/salt/neutron-plugin-ml2)
  -  [procps](/salt/procps)
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
│   ├── default
│   │   └── neutron-server
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-neutron-server.conf
│   ├── network
│   │   └── interfaces.d
│   │       └── eth2.cfg
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-server.json
│   └── supervisor
│       └── conf.d
│           └── neutron-server.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
