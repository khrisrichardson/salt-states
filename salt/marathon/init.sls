# vi: set ft=yaml.jinja :

include:
  -  mesos

marathon:
  pkg.installed:
    - require:
      - pkgrepo:   mesos
  service.running:
    - enable:      True
    - watch:
      - pkg:       maraton
