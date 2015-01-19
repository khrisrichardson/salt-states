# vi: set ft=yaml.jinja :

include:
  -  cloudera-cm4

cloudera-cm4-daemons:
  pkg.installed:
    - name:        cloudera-manager-daemons
    - require:
      - pkgrepo:   cloudera-cm4
