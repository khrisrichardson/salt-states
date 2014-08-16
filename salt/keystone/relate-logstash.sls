# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('logstash') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  logstash

{% if minions['logstash'] %}

/etc/logstash/conf.d/input-file-{{ psls }}.conf:
  file.managed:
    - source:      salt://{{ psls }}/etc/logstash/conf.d/input-file-{{ psls }}.conf
    - user:        logstash
    - group:       logstash
    - mode:       '0644'
    - require:
      - pkg:       logstash
    - watch_in:
      - service:   logstash

{% else %}

/etc/logstash/conf.d/input-file-{{ psls }}.conf:
  file.absent:
    - watch_in:
      - service:   logstash

{% endif %}
