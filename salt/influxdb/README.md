# influxdb

## Depends:

  -  [sensu-client](/salt/sensu-client)
  -  [sudo](/salt/sudo)

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
│           └── checks-influxdb.json
├── init.sls
├── opt
│   └── influxdb
│       └── shared
│           └── config.toml
└── relate-sensu-api.sls
```
