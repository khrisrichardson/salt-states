# graphite-web

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

  -  [graphite-web](/salt/graphite-web)
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
│   └── supervisor
│       └── conf.d
│           └── graphite-web.conf
├── init.sls
├── map.jinja
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
                        └── views.py
```
