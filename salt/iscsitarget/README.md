# iscsitarget

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [cinder-volume](/salt/cinder-volume)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── default
│   │   └── iscsitarget
│   └── sensu
│       └── conf.d
│           └── checks-iscsitarget.json
├── init.sls
└── relate-sensu-api.sls
```
