# vi: set ft=yaml.jinja :

include:
  -  java-common

oracle-java7-set-default:
  pkg.installed:
   {% if salt['config.get']('os_family') == 'Debian' %}
      - pkgrepo:   webupd8team-java
   {% endif %}
