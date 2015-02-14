# maven

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
    └── .m2
        └── settings.xml
```
