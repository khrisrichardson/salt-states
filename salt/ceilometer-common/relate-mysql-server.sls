# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mysql-server') %}

{% if minions['mysql-server'] %}

include:
  -  ceilometer-common

/var/lib/ceilometer/ceilometer.sqlite:
  file.absent:
    - watch:
      - pkg:       ceilometer-common

{% endif %}
