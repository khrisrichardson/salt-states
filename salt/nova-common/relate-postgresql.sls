# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('postgresql') %}

{% if minions['postgresql'] %}

include:
  -  nova-common

/var/lib/nova/nova.sqlite:
  file.absent:
    - watch:
      - pkg:       nova-common

{% endif %}
