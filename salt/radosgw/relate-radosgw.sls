# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('radosgw') %}

{% if minions['radosgw']|count > 1 %}

include:
  -  radosgw.depend-haproxy

{% endif %}
