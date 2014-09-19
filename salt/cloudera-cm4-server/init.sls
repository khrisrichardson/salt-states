# vi: set ft=yaml.jinja :

include:
  -  cloudera-cm4-agent
  -  cloudera-cm4-daemons
  -  cloudera-cm4-server-db
  {% if   salt['config.get']('os_family') == 'RedHat' %}
  -  oracle-j2sdk1_6
  {% elif salt['config.get']('os_family') == 'Debian' %}
  -  oracle-java6-installer
  {% endif %}

cloudera-cm4-server:
  pkg.installed:
    - name:        cloudera-manager-server
    - require:
      - pkgrepo:   cloudera-cm4
  service.running:
    - name:        cloudera-scm-server
    - enable:      True
    - watch:
      - pkg:       cloudera-cm4-server
      - service:   cloudera-cm4-server-db
      - file:     /usr/bin/java
