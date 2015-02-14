# neutron-lbaas-agent

## Depends:

  -  [haproxy](/salt/haproxy)
  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
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
│   │       └── input-file-neutron-lbaas-agent.conf
│   ├── neutron
│   │   ├── lbaas_agent.ini
│   │   └── rootwrap.d
│   │       └── lbaas-haproxy.filters
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-lbaas-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-lbaas-agent.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
