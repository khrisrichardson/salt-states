# racoon

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [openvswitch-ipsec](/salt/openvswitch-ipsec)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── racoon
│   │   ├── psk.txt
│   │   ├── racoon-tool.conf
│   │   └── racoon.conf
│   └── sensu
│       └── conf.d
│           └── checks-racoon.json
├── init.sls
└── relate-sensu-api.sls
```
