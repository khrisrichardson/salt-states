# neutron-plugin-openvswitch-agent

## Depends:

  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
  -  [neutron-plugin-ml2](/salt/neutron-plugin-ml2)
  -  [openvswitch-switch](/salt/openvswitch-switch)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  [nova-compute-docker](/salt/nova-compute-docker)
  -  [nova-compute-lxc](/salt/nova-compute-lxc)

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
│   │       └── input-file-neutron-plugin-openvswitch-agent.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-plugin-openvswitch-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-plugin-openvswitch-agent.conf
├── init.sls
├── relate-logstash.sls
├── relate-sensu-api.sls
└── root
    └── bin
        └── neutron-plugin-openvswitch-agent.sh
```
