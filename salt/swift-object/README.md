# swift-object

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
│   │       └── checks-swift-object.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── swift-object.conf
│   └── swift
│       └── object-server.conf
├── init.sls
├── relate-sensu-api.sls
└── root
    └── bin
        └── swift-object.sh
```
