# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mariadb-server') %}

{% if minions['mariadb-server'] %}

include:
  -  nova-baremetal

/var/lib/nova/baremetal-nova.sqlite:
  file.absent:
    - watch:
      - pkg:       nova-baremetal

{% endif %}
