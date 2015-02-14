# neutron-l3-agent

## Depends:

  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
  -  [neutron-metadata-agent](/salt/neutron-metadata-agent)
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
│   │       └── input-file-neutron-l3-agent.conf
│   ├── neutron
│   │   └── l3_agent.ini
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-l3-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-l3-agent.conf
├── init.sls
├── relate-logstash.sls
├── relate-sensu-api.sls
└── root
    └── bin
        └── neutron-l3-agent.sh
```
