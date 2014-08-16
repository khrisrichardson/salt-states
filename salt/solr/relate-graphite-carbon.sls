# vi: set ft=yaml.jinja :

{% set psls  = sls.split('.')[0] %}
{% set roles = [] %}
{% do  roles.append('cloudera-cm4-server') %}
{% do  roles.append('cloudera-cm5-server') %}
{% do  roles.append('graphite-carbon') %}
{% do  roles.append('influxdb') %}
{% set minions = salt['roles.dict'](roles) %}

include:
  -  jmxtrans-agent
  -  solr

{% if minions['graphite-carbon']
   or minions['influxdb'] %}

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
      - service:   tomcat7
     {% endif %}

{% else %}

/opt/jmxtrans/etc/{{ psls }}.xml:
  file.absent:
    - watch_in:
     {% if minions['cloudera-cm4-server']
        or minions['cloudera-cm5-server'] %}
#     - cmd:      /root/bin/cm_client.py
     {% else %}
      - service:   tomcat7
     {% endif %}

{% endif %}
