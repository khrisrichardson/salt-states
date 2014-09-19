# vi: set ft=yaml.jinja :

{# set minions = salt['roles.dict']('logstash') #}

#include:
# -  cloudera-cm5-server

{# if minions['logstash'] #}

#/etc/cloudera-scm-server/log4j.properties:
# file.append:
#   - text:      |-
#                  log4j.appender.JSON=org.apache.log4j.FileAppender
#                  log4j.appender.JSON.Append=true
#                  log4j.appender.JSON.File=${cmf.log.dir}/cloudera-cm5-server.json
#                  log4j.appender.JSON.layout=net.logstash.log4j.JSONEventLayoutV1
#                  log4j.appender.JSON.layout.LocationInfo=true
#   - require:
#     - pkg:       cloudera-cm5-server
#     - file:     /usr/share/cmf/lib/json-smart-1.2.jar
#     - file:     /usr/share/cmf/lib/jsonevent-layout-1.6.jar

{# endif #}
