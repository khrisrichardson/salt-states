# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('postgresql') %}

{% if minions['postgresql'] %}

include:
  -  cinder-common

/var/lib/cinder/cinder.sqlite:
  file.absent:
    - watch:
      - pkg:       cinder-common

{% endif %}
