# node-giraffe-web

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
│   │       └── checks-node-giraffe-web.json
│   └── systemd
│       └── system
│           └── node-giraffe-web.service
├── init.sls
├── relate-sensu-api.sls
└── usr
    └── local
        └── lib
            └── node_modules
                └── giraffe-web
                    ├── bin
                    │   └── supervisor
                    ├── dashboards.js
                    └── vendor
                        └── giraffe
                            └── css
                                ├── legend.css
                                └── main.css
```
