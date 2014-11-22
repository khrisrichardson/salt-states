# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('influxdb') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  python-influxdb
  -  salt-minion

{% if minions['influxdb'] %}

/etc/salt/minion.d/influxdb.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/minion.d/influxdb.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/salt/minion.d
      - pip:       python-influxdb
    - watch_in:
      - service:   salt-minion

{% endif %}
