# node-giraffe-web

## Depends:

  -  [dnsutils](/salt/dnsutils)
  -  [netbase](/salt/netbase)
  -  [node-supervisor](/salt/node-supervisor)
  -  [npm](/salt/npm)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [graphite-web](/salt/graphite-web)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-node-giraffe-web.json
├── init.sls
├── relate-graphite-web.sls
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
