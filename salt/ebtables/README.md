# ebtables

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [nova-compute-libvirt](/salt/nova-compute-libvirt)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── default
│   │   └── ebtables
│   ├── ethertypes
│   └── sensu
│       └── conf.d
│           └── checks-ebtables.json
├── init.sls
└── relate-sensu-api.sls
```
