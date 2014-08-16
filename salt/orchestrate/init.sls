# vi: set ft=yaml.jinja :

{% set related = salt['pillar.get']('related', {}) %}
{% set minion  = related.get('minion', '') %}
{% set roles   = related.get('roles',  None) %}
{% set states  = salt['roles.related_states'](minion=minion, roles=roles) %}
{% if  states %}
include:
{% for state in states|sort %}
  - {{ state }}
{% endfor %}
{% else %}
::
  cmd.run:         []
{% endif %}
