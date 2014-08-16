# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('sensu-dashboard') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  sensu-server

{% if minions['sensu-dashboard'] %}

/etc/sensu/conf.d/sensu-dashboard.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/sensu/conf.d/sensu-dashboard.json
    - user:        sensu
    - group:       sensu
    - mode:       '0444'
    - require:
      - file:     /etc/sensu/conf.d
    - watch_in:
      - service:   sensu-server

{% else %}

/etc/sensu/conf.d/sensu-dashboard.json:
  file:
    - absent
    - watch_in:
      - service:   sensu-server

{% endif %}
