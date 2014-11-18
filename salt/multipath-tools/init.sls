# vi: set ft=yaml.jinja :

{% from  'multipath-tools/map.jinja'
   import multipath_tools
   with   context %}

multipath-tools:
  pkg.installed:
    - order:      -1
    - name:     {{ multipath_tools['pkg']['name'] }}
  service.running:
    - name:     {{ multipath_tools['service']['name'] }}
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       multipath-tools
