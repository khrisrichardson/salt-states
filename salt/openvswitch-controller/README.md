# openvswitch-controller

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── default
│   │   └── openvswitch-controller
│   └── sensu
│       └── conf.d
│           └── checks-openvswitch-controller.json
├── init.sls
└── relate-sensu-api.sls
```
