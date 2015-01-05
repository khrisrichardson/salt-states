# maven

## Description:

Maven is a software project management and comprehension tool. Based on the concept of a project object model (POM), Maven can manage a project's build, reporting and documentation from a central piece of information.

Maven's primary goal is to allow a developer to comprehend the complete state of a development effort in the shortest period of time. In order to attain this goal there are several areas of concern that Maven attempts to deal with:

  * Making the build process easy
  * Providing a uniform build system
  * Providing quality project information
  * Providing guidelines for best practices development
  * Allowing transparent migration to new features

## Depends:

  -  [debianutils](/salt/debianutils)
  -  [oracle-j2sdk1\_7](/salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer](/salt/oracle-java7-installer)
  -  [tar](/salt/tar)
  -  [wget](/salt/wget)

## Reverse Depends:

  -  [elasticsearch-graphite](/salt/elasticsearch-graphite)
  -  [guvnor](/salt/guvnor)
  -  [jenkins](/salt/jenkins)
  -  [jmxtrans-agent](/salt/jmxtrans-agent)
  -  [solr](/salt/solr)
  -  [tomcat7](/salt/tomcat7)

## Relates:

  -  [socks5](/salt/socks5)

## Files:

```bash
.
├── etc
│   └── profile.d
│       └── maven.sh
├── exec.sls
├── init.sls
├── relate-socks5.sls
└── root
```
