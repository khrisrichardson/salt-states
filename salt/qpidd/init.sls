# vi: set ft=yaml.jinja :

{% from  'qpidd/map.jinja'
   import qpidd
   with   context %}

qpidd:
  pkg.installed:
    - name:     {{ qpidd['pkg']['name'] }}
  service.running:
    - enable:      True
    - watch:
      - pkg:       qpidd

/etc/qpidd.conf:
  file.managed:
    - source:      salt://{{ sls }}/etc/qpidd.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       qpidd
    - watch_in:
      - service:   qpidd
