# vi: set ft=yaml.jinja :

include:
  -  cloudera-cm5

cloudera-cm5-daemons:
  pkg.installed:
    - name:        cloudera-manager-daemons
    - require:
      - pkgrepo:   cloudera-cm5
