# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mysql-server') %}

{% if minions['mysql-server'] %}

include:
  -  nova-baremetal

/var/lib/nova/baremetal-nova.sqlite:
  file.absent:
    - watch:
      - pkg:       nova-baremetal

{% endif %}
