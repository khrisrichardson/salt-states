# vi: set ft=yaml.jinja :

include:
  -  datastax
  {% if   salt['config.get']('os_family') == 'RedHat' %}
  -  oracle-j2sdk1_7
  {% elif salt['config.get']('os_family') == 'Debian' %}
  -  oracle-java7-installer
  {% endif %}

cassandra:
  pkg.installed:
    - require:
      - pkgrepo:   datastax
