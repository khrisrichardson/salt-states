# vi: set ft=yaml.jinja :

{% from 'incron/map.jinja' import map with context %}

incron:
  pkg.installed:
    - order:      -1
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - reload:      True
    - sig:         incrond
    - watch:
      - pkg:       incron

/etc/incron.allow:
  file.managed:
    - source:      salt://{{ sls }}/etc/incron.allow
    - user:        root
    - group:    {{ map.get('/etc/incron.allow', {}).get('file', {}).get('group') }}
    - mode:       '0640'
    - watch:
      - pkg:       incron
    - watch_in:
      - service:   incron
