# vi: set ft=yaml.jinja :

ganglia-monitor:
  pkg.installed:
    - name:     {{ salt['config.get']('ganglia-monitor:pkg:name') }}
  service.running:
    - name:     {{ salt['config.get']('ganglia-monitor:service:name') }}
    - enable:      True
    - watch:
      - pkg:       ganglia-monitor
