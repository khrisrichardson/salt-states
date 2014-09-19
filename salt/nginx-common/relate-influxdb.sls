# vi: set ft=yaml.jinja :

{% set roles = [] %}
{% do  roles.append('graphite-carbon') %}
{% do  roles.append('influxdb') %}
{% set minions = salt['roles.dict'](roles) %}
{% set psls    = sls.split('.')[0] %}

include:
  -  collectd

{% if minions['graphite-carbon']
   or minions['influxdb'] %}

/etc/collectd.d/input-{{ psls }}.conf:
  file.managed:
    - source:      salt://{{ psls }}/etc/collectd.d/input-{{ psls }}.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       collectd
    - watch_in:
      - service:   collectd

{% else %}

/etc/collectd.d/input-{{ psls }}.conf:
  file.absent:
    - watch_in:
      - service:   collectd

{% endif %}
