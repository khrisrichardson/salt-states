# tomcat7

## Description:

Apache Tomcat implements the Java Servlet and the JavaServer Pages (JSP) specifications from Sun Microsystems, and provides a "pure Java" HTTP web server environment for Java code to run.

This package contains only the startup scripts for the system-wide daemon. No documentation or web applications are included here, please install the tomcat7-docs and tomcat7-examples packages if you want them. Install the authbind package if you need to use Tomcat on ports 1-1023. Install tomcat7-user instead of this package if you don't want Tomcat to start as a service.

## Depends:

  -  [liblog4j1-2-java] (salt/liblog4j1-2-java)
  -  [libtcnative-1] (salt/libtcnative-1)
  -  [maven] (salt/maven)
  -  [rsyslog] (salt/rsyslog)
  -  [sensu-client] (salt/sensu-client)

## Reverse Depends:

  -  [guvnor] (salt/guvnor)
  -  [solr] (salt/solr)

## Relates:

  -  [rsyslog] (salt/rsyslog)
  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── depend-maven.sls
├── Dockerfile
├── etc
│   ├── rsyslog.d
│   │   └── 60-tomcat7.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-tomcat7.json
│   └── systemd
│       └── system
│           └── tomcat7.service
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

12 directories, 11 files
```
