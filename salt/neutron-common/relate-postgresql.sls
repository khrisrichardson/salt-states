# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('postgresql') %}

{% if minions['postgresql'] %}

include:
  -  neutron-common

/var/lib/neutron/neutron.sqlite:
  file.absent:
    - watch:
      - pkg:       neutron-common

{% endif %}
