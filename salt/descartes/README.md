# descartes

## Description:



## Depends:

  -  [apache2] (salt/apache2)
  -  [git] (salt/git)
  -  [libpq-dev] (salt/libpq-dev)
  -  [libxml2-dev] (salt/libxml2-dev)
  -  [libxslt1-dev] (salt/libxslt1-dev)
  -  [postgresql] (salt/postgresql)
  -  [redis-server] (salt/redis-server)
  -  [ruby-rvm] (salt/ruby-rvm)
  -  [sensu-client] (salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [postgresql] (salt/postgresql)
  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── depend-apache2.sls
├── depend-git.sls
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-descartes.json
│   └── systemd
│       └── system
│           └── descartes.service
├── init.sls
├── opt
│   └── descartes
├── relate-postgresql.sls
└── relate-sensu-api.sls

8 directories, 9 files
```
