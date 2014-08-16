# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('postgresql') %}

{% if minions['postgresql'] %}

include:
  -  glance-api

/var/lib/glance/glance.sqlite:
  file.absent:
    - watch:
      - pkg:       glance-api

{% endif %}
