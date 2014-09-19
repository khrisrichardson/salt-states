# cloudera-cm5-server-db-2

## Description:

This package configures an "embedded" PostgreSQL server, running as user
cloudera-scm on port 7432. Installing this package short-circuits the database
configuration otherwise necessary in /etc/cloudera-scm-server/db.properties.

## Depends:

  -  [cloudera-cm5](salt/cloudera-cm5)
  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  [cloudera-cm5-server](salt/cloudera-cm5-server)

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-cloudera-cm5-server-db-2.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 3 files
```
