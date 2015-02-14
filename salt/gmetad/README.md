# gmetad

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
│   ├── ganglia
│   │   └── gmetad.conf
│   └── sensu
│       └── conf.d
│           └── checks-gmetad.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
