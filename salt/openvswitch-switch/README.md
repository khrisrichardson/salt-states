# openvswitch-switch

## Depends:

  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [neutron-plugin-openvswitch-agent](/salt/neutron-plugin-openvswitch-agent)

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-openvswitch-switch.conf
│   └── sensu
│       └── conf.d
│           └── checks-openvswitch-switch.json
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
