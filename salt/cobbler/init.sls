# vi: set ft=yaml.jinja :

include:
  -  cobbler-common

cobbler:
  pkg.installed:   []
  service.running:
    - name:     {{ salt['config.get']('cobbler:service:name') }}
    - enable:      True
    - watch:
      - pkg:       cobbler
