# neutron-dhcp-agent

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
│   │       └── input-file-neutron-dhcp-agent.conf
│   ├── neutron
│   │   ├── dhcp_agent.ini
│   │   └── rootwrap.d
│   │       └── dhcp.filters
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-dhcp-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-dhcp-agent.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
