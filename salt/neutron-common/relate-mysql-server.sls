# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mysql-server') %}

{% if minions['mysql-server'] %}

include:
  -  neutron-common

/var/lib/neutron/neutron.sqlite:
  file.absent:
    - watch:
      - pkg:       neutron-common

{% endif %}
