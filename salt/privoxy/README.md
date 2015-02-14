# privoxy

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)
  -  [socks5](/salt/socks5)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── privoxy
│   │   └── config
│   └── sensu
│       └── conf.d
│           └── checks-privoxy.json
├── init.sls
├── relate-sensu-api.sls
└── relate-socks5.sls
```
