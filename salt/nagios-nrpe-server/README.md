# nagios-nrpe-server

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
│   ├── nagios
│   │   └── nrpe.cfg
│   └── sensu
│       └── conf.d
│           └── checks-nagios-nrpe-server.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
