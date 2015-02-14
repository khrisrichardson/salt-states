# neutron-plugin-ryu-agent

## Depends:

  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
  -  [neutron-plugin-ryu](/salt/neutron-plugin-ryu)
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
│   │       └── input-file-neutron-plugin-ryu-agent.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-plugin-ryu-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-plugin-ryu-agent.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
