# uchiwa

## Description:



## Depends:

  -  [sensu](/salt/sensu)
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
│   ├── sensu
│   │   ├── conf.d
│   │   │   └── checks-uchiwa.json
│   │   └── uchiwa.json
│   └── systemd
│       └── system
│           └── uchiwa.service
├── init.sls
└── relate-sensu-api.sls
```
