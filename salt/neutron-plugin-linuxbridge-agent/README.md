# neutron-plugin-linuxbridge-agent

## Depends:

  -  [bridge-utils](/salt/bridge-utils)
  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
  -  [neutron-plugin-linuxbridge](/salt/neutron-plugin-linuxbridge)
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
│   │       └── input-file-neutron-plugin-linuxbridge-agent.conf
│   ├── neutron
│   │   └── rootwrap.d
│   │       └── linuxbridge-plugin.filters
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-plugin-linuxbridge-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-plugin-linuxbridge-agent.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
