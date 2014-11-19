# vi: set ft=yaml.jinja :

{% from 'cobbler/map.jinja' import map with context %}

include:
  -  cobbler-common

cobbler:
  pkg.installed:   []
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - watch:
      - pkg:       cobbler
