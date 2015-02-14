# tgt

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
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-tgt.json
│   └── tgt
│       └── targets.conf
├── init.sls
└── relate-sensu-api.sls
```
