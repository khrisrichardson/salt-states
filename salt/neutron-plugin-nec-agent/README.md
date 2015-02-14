# neutron-plugin-nec-agent

## Depends:

  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
  -  [neutron-plugin-nec](/salt/neutron-plugin-nec)
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
│   │       └── input-file-neutron-plugin-nec-agent.conf
│   ├── neutron
│   │   └── rootwrap.d
│   │       └── nec-plugin.filters
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-plugin-nec-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-plugin-nec-agent.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
