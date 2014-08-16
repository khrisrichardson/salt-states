# vi: set ft=yaml.jinja :

{# set minions = salt['roles.dict']('logstash') #}

{# if minions['logstash'] #}

#include:
# -  hadoop

#/etc/hadoop/conf.empty/log4j.properties:
# file.append:
#   - text:      |-
#                  log4j.appender.JSON=org.apache.log4j.FileAppender
#                  log4j.appender.JSON.Append=true
#                  log4j.appender.JSON.File=${hadoop.log.dir}/hadoop.json
#                  log4j.appender.JSON.layout=net.logstash.log4j.JSONEventLayoutV1
#                  log4j.appender.JSON.layout.LocationInfo=true
#   - require:
#     - pkg:       hadoop
#     - file:     /etc/hadoop/conf.empty/hadoop-env.sh
#     - file:     /usr/lib/hadoop/lib/json-smart-1.2.jar
#     - file:     /usr/lib/hadoop/lib/jsonevent-layout-1.6.jar

{# endif #}
