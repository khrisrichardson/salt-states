# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('rsyslog') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  rsyslog

{% if minions['rsyslog'] %}

/etc/rsyslog.d/60-{{ psls }}.conf:
  file.managed:
    - source:      salt://{{ psls }}/etc/rsyslog.d/60-{{ psls }}.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       rsyslog
    - watch_in:
      - service:   rsyslog

{% else %}

/etc/rsyslog.d/60-{{ psls }}.conf:
  file.absent:
    - watch_in:
      - service:   rsyslog

{% endif %}
