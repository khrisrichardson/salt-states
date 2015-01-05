# graphite-web

## Description:

Graphite consists of a storage backend and a web-based visualization frontend. Client applications send streams of numeric time-series data to the Graphite backend (called carbon), where it gets stored in fixed-size database files similar in design to RRD. The web frontend provides 2 distinct user interfaces for visualizing this data in graphs as well as a simple URL-based API for direct graph generation.

Graphite's design is focused on providing simple interfaces (both to users and applications), real-time visualization, high-availability, and enterprise scalability.

## Depends:

  -  [apache2](/salt/apache2)
  -  [graphite-carbon](/salt/graphite-carbon)
  -  [gunicorn](/salt/gunicorn)
  -  [libapache2-mod-wsgi](/salt/libapache2-mod-wsgi)
  -  [nginx](/salt/nginx)
  -  [postfix](/salt/postfix)
  -  [python-ldap](/salt/python-ldap)
  -  [python-psutil](/salt/python-psutil)
  -  [python-whisper](/salt/python-whisper)
  -  [ruby-rest-client](/salt/ruby-rest-client)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [memcached](/salt/memcached)
  -  [mysql-server](/salt/mysql-server)
  -  [postgresql](/salt/postgresql)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-apache2.sls
├── depend-gunicorn.sls
├── depend-libapache2-mod-wsgi.sls
├── depend-nginx.sls
├── depend-sqlite3.sls
├── etc
│   ├── graphite
│   │   └── local_settings.py
│   ├── gunicorn.d
│   │   └── graphite-web
│   ├── nginx
│   │   └── sites-available
│   │       └── graphite-web
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-graphite-web.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── graphite-web.conf
│   └── systemd
│       └── system
│           └── graphite-web.service
├── init.sls
├── relate-graphite-web.sls
├── relate-memcached.sls
├── relate-mysql-server.sls
├── relate-postgresql.sls
├── relate-sensu-api.sls
└── usr
    └── lib
        └── python2.7
            └── dist-packages
                └── graphite
                    └── render
                        ├── functions.py
                        └── views.py
```
