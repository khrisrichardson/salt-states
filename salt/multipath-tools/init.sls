# vi: set ft=yaml.jinja :

{% from 'multipath-tools/map.jinja' import map with context %}

multipath-tools:
  pkg.installed:
    - order:      -1
    - name:     {{ map.get('pkg', {}).get('name') }}
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       multipath-tools
