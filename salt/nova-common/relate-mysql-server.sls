# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mysql-server') %}

{% if minions['mysql-server'] %}

include:
  -  nova-common

/var/lib/nova/nova.sqlite:
  file.absent:
    - watch:
      - pkg:       nova-common

{% endif %}
