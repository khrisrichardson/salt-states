# neutron-plugin-bigswitch-agent

## Depends:

  -  [neutron-common](/salt/neutron-common)
  -  [neutron-plugin-bigswitch](/salt/neutron-plugin-bigswitch)
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
│   │       └── checks-neutron-plugin-bigswitch-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-plugin-bigswitch-agent.conf
├── init.sls
└── relate-sensu-api.sls
```
