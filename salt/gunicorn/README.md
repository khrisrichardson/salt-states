# gunicorn

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [graphite-web](/salt/graphite-web)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-gunicorn.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
