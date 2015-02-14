# neutron-vpn-agent

## Depends:

  -  [neutron-common](/salt/neutron-common)
  -  [neutron-metadata-agent](/salt/neutron-metadata-agent)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-vpn-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-vpn-agent.conf
├── init.sls
└── relate-sensu-api.sls
```
