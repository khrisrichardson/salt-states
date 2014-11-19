# vi: set ft=yaml.jinja :

{% from 'ganglia-monitor/map.jinja' import map with context %}

ganglia-monitor:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - watch:
      - pkg:       ganglia-monitor
