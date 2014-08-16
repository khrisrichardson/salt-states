# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mysql-server') %}

{% if minions['mysql-server'] %}

include:
  -  cinder-common

/var/lib/cinder/cinder.sqlite:
  file.absent:
    - watch:
      - pkg:       cinder-common

{% endif %}
