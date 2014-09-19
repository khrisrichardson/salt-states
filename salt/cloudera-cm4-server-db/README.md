# cloudera-cm4-server-db

## Description:

This package configures an "embedded" PostgreSQL server, running as user
cloudera-scm on port 7432. Installing this package short-circuits the database
configuration otherwise necessary in /etc/cloudera-scm-server/db.properties.

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
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-cloudera-cm4-server-db.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 3 files
```
