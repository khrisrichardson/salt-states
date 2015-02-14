# mongodb-server

## Depends:

  -  [python-pymongo](/salt/python-pymongo)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [salt-minion](/salt/salt-minion)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── mongodb.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-mongodb-server.json
│   └── supervisor
│       └── conf.d
│           └── mongodb-server.conf
├── init.sls
├── map.jinja
├── relate-salt-minion.sls
└── relate-sensu-api.sls
```
