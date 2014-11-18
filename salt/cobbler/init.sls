# vi: set ft=yaml.jinja :

{% from  'cobbler/map.jinja'
   import cobbler
   with   context %}

include:
  -  cobbler-common

cobbler:
  pkg.installed:   []
  service.running:
    - name:     {{ cobbler['service']['name'] }}
    - enable:      True
    - watch:
      - pkg:       cobbler
