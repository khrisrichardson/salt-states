# swift-account

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
│   │       └── checks-swift-account.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── swift-account.conf
│   └── swift
│       └── account-server.conf
├── init.sls
├── relate-sensu-api.sls
└── root
    └── bin
        └── swift-account.sh
```
