# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mariadb-server') %}

{% if minions['mariadb-server'] %}

include:
  -  ironic-common

/var/lib/ironic/ironic.sqlite:
  file.absent:
    - watch:
      - pkg:       ironic-common

{% endif %}
