# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mariadb-server') %}

{% if minions['mariadb-server'] %}

include:
  -  ceilometer-common

/var/lib/ceilometer/ceilometer.sqlite:
  file.absent:
    - watch:
      - pkg:       ceilometer-common

{% endif %}
