# nis

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
├── depend-supervisor.sls
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nis.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── nis.conf
│   └── yp.conf
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
