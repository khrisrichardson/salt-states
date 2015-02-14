# memcached

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
│   ├── default
│   │   └── memcached
│   ├── memcached.conf
│   └── sensu
│       └── conf.d
│           └── checks-memcached.json
├── init.sls
└── relate-sensu-api.sls
```
