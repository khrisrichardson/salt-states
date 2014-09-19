# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('elasticsearch') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  logstash

{% if   minions['elasticsearch']
   and 'logstash' in salt['config.get']('roles', []) %}

/etc/logstash/conf.d/output-elasticsearch.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/logstash/conf.d/output-elasticsearch.conf
    - user:        logstash
    - group:       logstash
    - mode:       '0644'
    - require:
      - pkg:       logstash
    - watch_in:
      - service:   logstash

{% endif %}
