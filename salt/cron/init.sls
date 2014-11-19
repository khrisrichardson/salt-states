# vi: set ft=yaml.jinja :

{% from 'cron/map.jinja' import map with context %}

cron:
  pkg.installed:
    - order:      -1
    - name:     {{ map.get('pkg', {}).get('name') }}
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - watch:
      - pkg:       cron
