# marathon

## Depends:

  -  [mesos](/salt/mesos)
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
│   └── sensu
│       └── conf.d
│           └── checks-marathon.json
├── init.sls
└── relate-sensu-api.sls
```
