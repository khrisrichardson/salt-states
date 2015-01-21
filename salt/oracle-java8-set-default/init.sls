# vi: set ft=yaml.jinja :

include:
  -  java-common

oracle-java8-set-default:
  pkg.installed:
   {% if salt['config.get']('os_family') == 'Debian' %}
      - pkgrepo:   webupd8team-java
   {% endif %}
    - require_in:
      - file:     /usr/bin/java
      - file:     /usr/bin/javac
