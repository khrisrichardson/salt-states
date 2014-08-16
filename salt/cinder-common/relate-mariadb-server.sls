# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mariadb-server') %}

{% if minions['mariadb-server'] %}

include:
  -  cinder-common

/var/lib/cinder/cinder.sqlite:
  file.absent:
    - watch:
      - pkg:       cinder-common

{% endif %}
