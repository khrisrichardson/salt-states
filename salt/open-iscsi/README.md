# open-iscsi

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
│   │   └── open-iscsi
│   ├── iscsi
│   │   └── iscsid.conf
│   └── sensu
│       └── conf.d
│           └── checks-open-iscsi.json
├── init.sls
└── relate-sensu-api.sls
```
