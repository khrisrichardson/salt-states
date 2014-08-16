# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('postgresql') %}

{% if minions['postgresql'] %}

include:
  -  keystone

/var/lib/keystone/keystone.db:
  file.absent:
    - watch:
      - pkg:       keystone

{% endif %}
