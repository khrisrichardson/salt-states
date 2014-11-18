# vi: set ft=yaml.jinja :

{% from  'ganglia-monitor/map.jinja'
   import ganglia_monitor
   with   context %}

ganglia-monitor:
  pkg.installed:
    - name:     {{ ganglia_monitor['pkg']['name'] }}
  service.running:
    - name:     {{ ganglia_monitor['service']['name'] }}
    - enable:      True
    - watch:
      - pkg:       ganglia-monitor
