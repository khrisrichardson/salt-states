# cobbler

## Depends:

  -  [nginx-common](/salt/nginx-common)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [coreos](/salt/coreos)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-cobbler.json
├── init.sls
├── map.jinja
├── relate-coreos.sls
├── relate-sensu-api.sls
└── usr
    └── share
        └── nginx
            └── html
                └── pxe-cloud-config.yml
```
