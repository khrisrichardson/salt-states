# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('postgresql') %}

{% if minions['postgresql'] %}

include:
  -  glance-registry

/var/lib/glance/glance.sqlite:
  file.absent:
    - watch:
      - pkg:       glance-registry

{% endif %}
