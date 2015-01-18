# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('redis-server') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  logstash

{% if minions['redis-server'] %}

/etc/logstash/conf.d/output-redis-server.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/logstash/conf.d/output-redis-server.conf
    - user:        logstash
    - group:       logstash
    - mode:       '0644'
    - require:
      - pkg:       logstash
    - watch_in:
      - service:   logstash

{% endif %}
