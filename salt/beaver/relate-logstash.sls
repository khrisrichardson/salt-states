# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('logstash') %}

{% if minions['logstash'] %}

include:
  -  beaver
  -  libzmq3-dev

{% endif %}
