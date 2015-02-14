# php5-fpm

## Depends:

  -  [php5](/salt/php5)
  -  [rsyslog](/salt/rsyslog)
  -  [ruby-crack](/salt/ruby-crack)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [rsyslog](/salt/rsyslog)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── rsyslog.d
│   │   └── 60-php5-fpm.conf
│   └── sensu
│       └── conf.d
│           └── checks-php5-fpm.json
├── init.sls
├── map.jinja
├── relate-rsyslog.sls
└── relate-sensu-api.sls
```
