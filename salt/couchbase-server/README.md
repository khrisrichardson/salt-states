# couchbase-server

## Depends:

  -  [libssl1\_0\_0](/salt/libssl1_0_0)
  -  [ruby-rest-client](/salt/ruby-rest-client)
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
│           └── checks-couchbase-server.json
├── init.sls
└── relate-sensu-api.sls
```
