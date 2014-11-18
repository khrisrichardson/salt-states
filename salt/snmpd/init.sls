# vi: set ft=yaml.jinja :

{% from  'snmpd/map.jinja'
   import snmpd
   with   context %}

snmpd:
  pkg.installed:
    - name:     {{ snmpd['pkg']['name'] }}
  service.running:
    - enable:      True
    - watch:
      - pkg:       snmpd
