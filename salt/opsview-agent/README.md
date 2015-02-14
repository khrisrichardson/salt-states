# opsview-agent

## Depends:

  -  [opsview-base](/salt/opsview-base)
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
│           └── checks-opsview-agent.json
├── init.sls
└── relate-sensu-api.sls
```
