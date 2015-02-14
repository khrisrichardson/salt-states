# salt-syndic

## Depends:

  -  [epel-release](/salt/epel-release)
  -  [salt-common](/salt/salt-common)
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
│   │       └── checks-salt-syndic.json
│   └── supervisor
│       └── conf.d
│           └── salt-syndic.conf
├── init.sls
└── relate-sensu-api.sls
```
