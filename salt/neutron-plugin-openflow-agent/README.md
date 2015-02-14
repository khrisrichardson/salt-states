# neutron-plugin-openflow-agent

## Depends:

  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
  -  [neutron-plugin-ml2](/salt/neutron-plugin-ml2)
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
│   │       └── input-file-neutron-plugin-openflow-agent.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-plugin-openflow-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-plugin-openflow-agent.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
