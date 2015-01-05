# node-redis-commander

## Description:



## Depends:

  -  [dnsutils](/salt/dnsutils)
  -  [netbase](/salt/netbase)
  -  [node-supervisor](/salt/node-supervisor)
  -  [npm](/salt/npm)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-node-redis-commander.json
│   └── systemd
│       └── system
│           └── node-redis-commander.service
├── init.sls
├── relate-sensu-api.sls
└── usr
    └── local
        └── lib
            └── node_modules
                └── redis-commander
                    └── bin
                        └── supervisor
```
