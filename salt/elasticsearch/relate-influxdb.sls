# vi: set ft=yaml.jinja :

{% set roles = [] %}
{% do  roles.append('graphite-carbon') %}
{% do  roles.append('influxdb') %}
{% set minions = salt['roles.list_minions'](roles) %}
{% set psls    = sls.split('.')[0] %}

include:
  -  elasticsearch
  -  elasticsearch-graphite
  -  jmxtrans-agent

{% if minions['graphite-carbon']
   or minions['influxdb'] %}

/etc/default/elasticsearch:
  file.replace:
    - name:    {{ salt['config.get']('/etc/default/elasticsearch:file:name') }}
    - pattern: '#*ES_JAVA_OPTS=.*$'
    - repl:      'ES_JAVA_OPTS=-javaagent:/opt/jmxtrans/lib/jmxtrans-agent.jar=/opt/jmxtrans/etc/{{ psls }}.xml'
    - watch_in:
      - service:  elasticsearch

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
      - service:   elasticsearch

{% else %}

/etc/default/elasticsearch:
  file.replace:
    - name:    {{ salt['config.get']('/etc/default/elasticsearch:file:name') }}
    - pattern:  '^ES_JAVA_OPTS=.*$'
    - repl:     '#ES_JAVA_OPTS='
    - watch_in:
      - service:  elasticsearch

/opt/jmxtrans/etc/{{ psls }}.xml:
  file.absent:
    - watch_in:
      - service:   elasticsearch

{% endif %}
