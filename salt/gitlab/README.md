# gitlab

## Description:



## Depends:

  -  [build-essential](/salt/build-essential)
  -  [checkinstall](/salt/checkinstall)
  -  [curl](/salt/curl)
  -  [git-core](/salt/git-core)
  -  [gitlab-shell](/salt/gitlab-shell)
  -  [libcurl4-openssl-dev](/salt/libcurl4-openssl-dev)
  -  [libffi-dev](/salt/libffi-dev)
  -  [libgdbm-dev](/salt/libgdbm-dev)
  -  [libicu-dev](/salt/libicu-dev)
  -  [libncurses5-dev](/salt/libncurses5-dev)
  -  [libpq-dev](/salt/libpq-dev)
  -  [libxml2-dev](/salt/libxml2-dev)
  -  [libxslt1-dev](/salt/libxslt1-dev)
  -  [libyaml-dev](/salt/libyaml-dev)
  -  [logrotate](/salt/logrotate)
  -  [nginx](/salt/nginx)
  -  [postfix](/salt/postfix)
  -  [postgresql](/salt/postgresql)
  -  [python-docutils](/salt/python-docutils)
  -  [redis-server](/salt/redis-server)
  -  [ruby2_0](/salt/ruby2_0)
  -  [ruby2_0-dev](/salt/ruby2_0-dev)
  -  [ruby-bundler](/salt/ruby-bundler)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [postgresql](/salt/postgresql)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-logrotate.sls
├── depend-nginx.sls
├── etc
│   ├── init.d
│   │   └── gitlab
│   ├── logrotate.d
│   │   └── gitlab
│   ├── nginx
│   │   └── sites-available
│   │       └── gitlab
│   └── sensu
│       └── conf.d
│           └── checks-gitlab.json
├── home
│   └── git
│       └── gitlab
│           └── config
│               ├── database.yml
│               ├── gitlab.yml
│               ├── initializers
│               │   └── rack_attack.rb
│               └── unicorn.rb
├── init.sls
├── relate-postgresql.sls
└── relate-sensu-api.sls
```
