# rsyslog

## Description:

Rsyslog is a multi-threaded implementation of syslogd (a system utility providing support for message logging), with features that include:

* reliable syslog over TCP, SSL/TLS and RELP
* on-demand disk buffering
* email alerting
* writing to MySQL or PostgreSQL databases (via separate output plugins)
* permitted sender lists
* filtering on any part of the syslog message
* on-the-wire message compression
* fine-grained output format control
* failover to backup destinations
* enterprise-class encrypted syslog relaying

It is the default syslogd on Debian systems.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [dynaTrace-common](/salt/dynaTrace-common)
  -  [php5-fpm](/salt/php5-fpm)
  -  [tomcat7](/salt/tomcat7)

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── rsyslog.d
│   │   ├── 00-remote.conf
│   │   ├── 60-imtcp.conf
│   │   └── 60-imudp.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-rsyslog.json
│   └── systemd
│       └── system
│           └── rsyslog.service
├── init.sls
├── relate-logstash.sls
├── relate-rsyslog.sls
└── relate-sensu-api.sls

7 directories, 11 files
```
