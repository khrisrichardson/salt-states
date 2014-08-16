# vi: set ft=yaml.jinja :

{% set psls  = sls.split('.')[0] %}
{% set roles = [] %}
{% do  roles.append('cloudera-cm4-server') %}
{% do  roles.append('cloudera-cm5-server') %}
{% do  roles.append('graphite-carbon') %}
{% do  roles.append('influxdb') %}
{% set minions = salt['roles.dict'](roles) %}

include:
  -  hadoop-hdfs-namenode
  -  jmxtrans-agent

{% if      minions['graphite-carbon']
   or      minions['influxdb'] %}
{% if  not minions['cloudera-cm4-server']
   and not minions['cloudera-cm5-server'] %}

extend:
  /etc/hadoop/conf.empty/hadoop-env.sh:
    file:
      - contents: 'export HADOOP_NAMENODE_OPTS="$HADOOP_NAMENODE_OPTS -javaagent:/opt/jmxtrans/lib/jmxtrans-agent.jar=/opt/jmxtrans/etc/{{ psls }}.xml"'
      - require:
        - cmd:     mvn dependency:copy org.jmxtrans.agent:jmxtrans-agent
      - watch_in:
        - service: hadoop-hdfs-namenode

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
      - service:   hadoop-hdfs-namenode
     {% endif %}

{% else %}

/opt/jmxtrans/etc/{{ psls }}.xml:
  file.absent:
    - watch_in:
     {% if minions['cloudera-cm4-server']
        or minions['cloudera-cm5-server'] %}
#     - cmd:      /root/bin/cm_client.py
     {% else %}
      - service:   hadoop-hdfs-namenode
     {% endif %}

{% endif %}
