# swift-proxy

## Depends:

  -  [haproxy](/salt/haproxy)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)
  -  [swift](/salt/swift)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-haproxy.sls
├── depend-supervisor.sls
├── etc
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-swift-proxy.json
│   └── supervisor
│       └── conf.d
│           └── swift-proxy.conf
├── init.sls
└── relate-sensu-api.sls
```
