# vi: set ft=yaml.jinja :

{% from  'incron/map.jinja'
   import incron
   with   context %}

incron:
  pkg.installed:
    - order:      -1
  service.running:
    - name:     {{ incron['service']['name'] }}
    - enable:      True
    - reload:      True
    - sig:         incrond
    - watch:
      - pkg:       incron

/etc/incron.allow:
  file.managed:
    - source:      salt://{{ sls }}/etc/incron.allow
    - user:        root
    - group:    {{ incron['/etc/incron.allow']['file']['group'] }}
    - mode:       '0640'
    - watch:
      - pkg:       incron
    - watch_in:
      - service:   incron
