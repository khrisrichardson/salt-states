# rsyslog

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [dynaTrace-common](/salt/dynaTrace-common)
  -  [php5-fpm](/salt/php5-fpm)
  -  [tomcat7](/salt/tomcat7)

## Relates:

  -  [logstash](/salt/logstash)
  -  [rsyslog](/salt/rsyslog)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── rsyslog.d
│   │   ├── 00-remote.conf
│   │   ├── 60-imtcp.conf
│   │   └── 60-imudp.conf
│   └── sensu
│       └── conf.d
│           └── checks-rsyslog.json
├── init.sls
├── relate-logstash.sls
├── relate-rsyslog.sls
└── relate-sensu-api.sls
```
