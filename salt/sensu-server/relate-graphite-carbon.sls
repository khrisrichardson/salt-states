# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('graphite-carbon') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  sensu-server

{% if minions['graphite-carbon'] %}

/etc/sensu/conf.d/graphite-carbon.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/sensu/conf.d/graphite-carbon.json
    - user:        sensu
    - group:       sensu
    - mode:       '0444'
    - require:
      - file:     /etc/sensu/conf.d
    - watch_in:
      - service:   sensu-server

{% else %}

/etc/sensu/conf.d/graphite-carbon.json:
  file:
    - absent
    - watch_in:
      - service:   sensu-server

{% endif %}
