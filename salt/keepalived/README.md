# keepalived

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
│   ├── keepalived
│   │   └── keepalived.conf
│   └── sensu
│       └── conf.d
│           └── checks-keepalived.json
├── init.sls
└── relate-sensu-api.sls
```
