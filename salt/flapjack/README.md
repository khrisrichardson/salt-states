# flapjack

## Depends:

  -  [python-apt](/salt/python-apt)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [redis-server](/salt/redis-server)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── flapjack
│   │   └── flapjack_config.yaml
│   └── sensu
│       └── conf.d
│           └── checks-flapjack.json
├── init.sls
├── map.jinja
├── relate-redis-server.sls
└── relate-sensu-api.sls
```
