# vi: set ft=yaml.jinja :

include:
  -  mesos

marathon:
  pkg.installed:
    - require:
      - pkgrepo:   mesos
