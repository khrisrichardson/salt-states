# puppetmaster

## Depends:

  -  [openssh-client](/salt/openssh-client)
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
│   └── sensu
│       └── conf.d
│           └── checks-puppetmaster.json
├── init.sls
└── relate-sensu-api.sls
```
