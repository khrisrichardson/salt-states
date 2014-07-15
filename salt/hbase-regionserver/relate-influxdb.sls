# vi: set ft=yaml.jinja :

{% set psls  = sls.split('.')[0] %}
{% set roles = [] %}
{% do  roles.append('cloudera-cm4-server') %}
{% do  roles.append('cloudera-cm5-server') %}
{% do  roles.append('graphite-carbon') %}
{% do  roles.append('influxdb') %}
{% set minions = salt['roles.list_minions'](roles) %}

include:
  -  hbase-regionserver
  -  jmxtrans-agent

{% if      minions['graphite-carbon']
   or      minions['influxdb'] %}
{% if  not minions['cloudera-cm4-server']
   and not minions['cloudera-cm5-server'] %}

extend:
  /etc/hbase/conf.dist/hbase-env.sh:
    file:
      - text:     'export HBASE_REGIONSERVER_OPTS="$HBASE_REGIONSERVER_OPTS -javaagent:/opt/jmxtrans/lib/jmxtrans-agent.jar=/opt/jmxtrans/etc/{{ psls }}.xml"'
      - require:
        - cmd:     mvn dependency:copy org.jmxtrans.agent:jmxtrans-agent
      - watch_in:
        - service: hbase-regionserver

{% endif %}

/opt/jmxtrans/etc/{{ psls }}.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/opt/jmxtrans/etc/{{ psls }}.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /opt/jmxtrans/etc
    - watch_in:
     {% if minions['cloudera-cm4-server']
        or minions['cloudera-cm5-server'] %}
#     - cmd:      /root/bin/cm_client.py
     {% else %}
      - service:   hbase-regionserver
     {% endif %}

{% else %}

/opt/jmxtrans/etc/{{ psls }}.xml:
  file.absent:
    - watch_in:
     {% if minions['cloudera-cm4-server']
        or minions['cloudera-cm5-server'] %}
#     - cmd:      /root/bin/cm_client.py
     {% else %}
      - service:   hbase-regionserver
     {% endif %}

{% endif %}
