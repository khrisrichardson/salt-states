# vi: set ft=yaml.jinja :

include:
  -  cloudera-cm5
  -  cloudera-cm5-agent
  -  cloudera-cm5-daemons
  -  cloudera-cm5-server-db-2
  {% if   salt['config.get']('os_family') == 'RedHat' %}
  -  oracle-j2sdk1_7
  {% elif salt['config.get']('os_family') == 'Debian' %}
  -  oracle-java7-installer
  {% endif %}

cloudera-cm5-server:
  pkg.installed:
    - name:        cloudera-manager-server
    - require:
      - pkgrepo:   cloudera-cm5
  service.running:
    - name:        cloudera-scm-server
    - enable:      True
    - watch:
      - pkg:       cloudera-cm5-server
      - service:   cloudera-cm5-server-db-2
      - file:     /usr/bin/java
