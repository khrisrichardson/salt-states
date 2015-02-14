# redis-server

## Depends:

  -  [procps](/salt/procps)
  -  [ruby-redis](/salt/ruby-redis)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [descartes](/salt/descartes)
  -  [gitlab](/salt/gitlab)

## Relates:

  -  [redis-server](/salt/redis-server)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-redis-server.json
├── init.sls
├── map.jinja
├── relate-redis-server.sls
└── relate-sensu-api.sls
```
