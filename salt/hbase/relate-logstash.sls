# vi: set ft=yaml.jinja :

{# set minions = salt['roles.dict']('logstash') #}

#include:
# -  hbase

{# if minions['logstash'] #}

#/etc/hbase/conf.dist/log4j.properties:
# file.append:
#   - text:      |-
#                  log4j.appender.JSON=org.apache.log4j.FileAppender
#                  log4j.appender.JSON.Append=true
#                  log4j.appender.JSON.File=${hbase.log.dir}/hbase.json
#                  log4j.appender.JSON.layout=net.logstash.log4j.JSONEventLayoutV1
#                  log4j.appender.JSON.layout.LocationInfo=true
#   - require:
#     - pkg:       hbase
#     - file:     /etc/hbase/conf.dist/hbase-env.sh
#     - file:     /usr/lib/hbase/lib/json-smart-1.2.jar
#     - file:     /usr/lib/hbase/lib/jsonevent-layout-1.6.jar

{# endif #}
