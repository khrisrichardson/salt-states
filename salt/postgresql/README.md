# postgresql

## Description:

This metapackage always depends on the currently supported PostgreSQL database server version.

PostgreSQL is a fully featured object-relational database management system.  It supports a large part of the SQL standard and is designed to be extensible by users in many aspects.  Some of the features are: ACID transactions, foreign keys, views, sequences, subqueries, triggers, user-defined types and functions, outer joins, multiversion concurrency control.  Graphical user interfaces and bindings for many programming languages are available as well.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [descartes](/salt/descartes)
  -  [gitlab](/salt/gitlab)

## Relates:

  -  [calamari](/salt/calamari)
  -  [salt-minion](/salt/salt-minion)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── postgresql
│   │   └── 9.1
│   │       └── main
│   │           └── postgresql.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-postgresql.json
│   └── systemd
│       └── system
│           └── postgresql.service
├── init.sls
├── relate-calamari.sls
├── relate-salt-minion.sls
└── relate-sensu-api.sls

9 directories, 9 files
```
