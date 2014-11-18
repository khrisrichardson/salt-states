# vi: set ft=yaml.jinja :

{% from  'newrelic/map.jinja'
   import newrelic
   with   context %}

include:
  -  newrelic

newrelic-sysmond:
  pkg.installed:
    - order:      -1
    - require:
      - pkgrepo:   newrelic
  service.running:
    - enable:      True
    - watch:
      - cmd:       nrsysmond-config

nrsysmond-config:
  cmd.wait:
    - name:        nrsysmond-config --set license_key={{ newrelic['license_key'] }}
    - watch:
      - pkg:       newrelic-sysmond
