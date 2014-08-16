# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('rabbitmq-server') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  sensu-server

{% if minions['rabbitmq-server'] %}

/etc/sensu/conf.d/rabbitmq-server.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/sensu/conf.d/rabbitmq-server.json
    - user:        sensu
    - group:       sensu
    - mode:       '0444'
    - require:
      - file:     /etc/sensu/conf.d
    - watch_in:
      - service:   sensu-server

{% else %}

/etc/sensu/conf.d/rabbitmq-server.json:
  file:
    - absent
    - watch_in:
      - service:   sensu-server

{% endif %}
