# consul-client

## Depends:

  -  [consul](/salt/consul)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [consul-server](/salt/consul-server)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-consul-client.json
│   └── supervisor
│       └── conf.d
│           └── consul-client.conf
├── init.sls
├── relate-consul-server.sls
└── relate-sensu-api.sls
```
