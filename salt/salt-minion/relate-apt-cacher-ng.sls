# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('apt-cacher-ng') %}

{% if minions['apt-cacher-ng'] %}

include:
  -  apt

{% endif %}
