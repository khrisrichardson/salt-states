# swift-object-expirer

## Depends:

  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)
  -  [swift](/salt/swift)

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
│   │       └── checks-swift-object-expirer.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── swift-object-expirer.conf
│   └── swift
│       └── object-expirer.conf
├── init.sls
└── relate-sensu-api.sls
```
