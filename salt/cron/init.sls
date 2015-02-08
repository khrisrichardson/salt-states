# vi: set ft=yaml.jinja :

{% from 'cron/map.jinja' import map with context %}

include:
  - .depend-supervisor

cron:
  pkg.installed:
    - order:      -1
    - name:     {{ map.get('pkg', {}).get('name') }}
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
{% endif %}
    - name:     {{ map.get('service', {}).get('name') }}
    - watch:
      - pkg:       cron
