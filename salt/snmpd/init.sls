# vi: set ft=yaml.jinja :

{% from 'snmpd/map.jinja' import map with context %}

snmpd:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
  service.running:
    - enable:      True
    - watch:
      - pkg:       snmpd
