# ironic-api

## Depends:

  -  [ironic-common](/salt/ironic-common)
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
│   │       └── checks-ironic-api.json
│   └── supervisor
│       └── conf.d
│           └── ironic-api.conf
├── init.sls
└── relate-sensu-api.sls
```
