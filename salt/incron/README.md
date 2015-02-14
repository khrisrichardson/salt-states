# incron

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [salt-minion](/salt/salt-minion)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── incron.allow
│   └── sensu
│       └── conf.d
│           └── checks-incron.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
