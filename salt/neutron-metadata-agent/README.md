# neutron-metadata-agent

## Depends:

  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  [neutron-dhcp-agent](/salt/neutron-dhcp-agent)
  -  [neutron-l3-agent](/salt/neutron-l3-agent)
  -  [neutron-vpn-agent](/salt/neutron-vpn-agent)

## Relates:

  -  [keystone](/salt/keystone)
  -  [logstash](/salt/logstash)
  -  [nova-api-metadata](/salt/nova-api-metadata)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-neutron-metadata-agent.conf
│   ├── neutron
│   │   └── metadata_agent.ini
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-metadata-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-metadata-agent.conf
├── init.sls
├── relate-keystone.sls
├── relate-logstash.sls
├── relate-nova-api-metadata.sls
└── relate-sensu-api.sls
```
