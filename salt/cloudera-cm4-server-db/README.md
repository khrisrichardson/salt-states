# cloudera-cm4-server-db

## Depends:

  -  [cloudera-cm4](/salt/cloudera-cm4)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [cloudera-cm4-server](/salt/cloudera-cm4-server)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-cloudera-cm4-server-db.json
├── init.sls
└── relate-sensu-api.sls
```
