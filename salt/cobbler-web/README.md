# cobbler-web

## Depends:

  -  [apache2](/salt/apache2)
  -  [cobbler-common](/salt/cobbler-common)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-apache2.sls
├── etc
│   ├── apache2
│   │   └── sites-available
│   │       └── cobbler-common
│   └── sensu
│       └── conf.d
│           └── checks-cobbler-web.json
├── init.sls
└── relate-sensu-api.sls
```
