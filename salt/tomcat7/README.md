# tomcat7

## Depends:

  -  [liblog4j1-2-java](/salt/liblog4j1-2-java)
  -  [libtcnative-1](/salt/libtcnative-1)
  -  [maven](/salt/maven)
  -  [rsyslog](/salt/rsyslog)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [guvnor](/salt/guvnor)
  -  [solr](/salt/solr)

## Relates:

  -  [rsyslog](/salt/rsyslog)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-maven.sls
├── etc
│   ├── rsyslog.d
│   │   └── 60-tomcat7.conf
│   └── sensu
│       └── conf.d
│           └── checks-tomcat7.json
├── init.sls
├── relate-rsyslog.sls
├── relate-sensu-api.sls
├── root
│   └── pom.xml
└── var
    └── lib
        └── tomcat7
            └── conf
                └── server.xml
```
