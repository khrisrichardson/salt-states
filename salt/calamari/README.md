# calamari

## Description:



## Depends:

  -  [apache2](/salt/apache2)
  -  [git](/salt/git)
  -  [libapache2-mod-wsgi](/salt/libapache2-mod-wsgi)
  -  [logrotate](/salt/logrotate)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [graphite-carbon](/salt/graphite-carbon)
  -  [postgresql](/salt/postgresql)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-apache2.sls
├── depend-git.sls
├── depend-libapache2-mod-wsgi.sls
├── depend-logrotate.sls
├── depend-supervisor.sls
├── etc
│   ├── apache2
│   │   └── sites-available
│   │       └── calamari
│   ├── calamari
│   │   ├── alembic.ini
│   │   └── calamari.conf
│   ├── logrotate.d
│   │   └── calamari
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-calamari.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── calamari.conf
│   └── systemd
│       └── system
│           └── calamari.service
├── init.sls
├── relate-graphite-carbon.sls
├── relate-postgresql.sls
└── relate-sensu-api.sls
```
