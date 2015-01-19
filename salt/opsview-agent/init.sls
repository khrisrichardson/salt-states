# vi: set ft=yaml.jinja :

include:
  -  opsview-base

opsview-agent:
  pkg.installed:
    - require:
      - pkgrepo:   opsview-base
  service.running:
    - enable:      True
    - watch:
      - pkg:       opsview-agent
