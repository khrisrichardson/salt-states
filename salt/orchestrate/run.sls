# vi: set ft=yaml.jinja :

{% set related = salt['pillar.get']('related', {}) %}
{% set minion  = related.get('minion', '') %}
{% set roles   = related.get('roles',  None) %}
{% set order   = salt['roles.order'](minion=minion, roles=roles) %}
{% if  order %}
{% for role in order %}
role_{{ loop.index }}:
  salt.state:
    - tgt:         roles:{{ role }}
    - tgt_type:    grain
    - sls:      {{ role }}
   {% if not loop.first %}
    - require:
      - salt:      role_{{ loop.index - 1 }}
   {% endif %}
{% endfor %}
{% else %}
cmd.run:
  salt.function:
    - tgt:        '*'
    - arg:
      - :
{% endif %}
