# consul-web

## Depends:

  -  [consul](/salt/consul)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-consul-web.json
│   └── supervisor
│       └── conf.d
│           └── consul-web.conf
├── init.sls
└── relate-sensu-api.sls
```
