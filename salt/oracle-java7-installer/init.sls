# vi: set ft=yaml.jinja :

{% set name = salt['config.get']('oracle-java7-installer:pkg:name') %}

include:
  -  java-common
  -  python-apt

{% if salt['config.get']('os_family') == 'Debian' %}

extend:
  accepted-oracle-license-v1-1-seen:
    cmd:
      - require_in:
        - pkg:     oracle-java7-installer

{% endif %}

oracle-java7-installer:
  pkg.installed:
    - name:     {{ name }}
   {% if   salt['config.get']('os_family') == 'RedHat' %}
    - version:     1.7.0_51-fcs
   {% endif %}
    - require:
   {% if salt['config.get']('os_family') == 'Debian' %}
      - pkgrepo:   webupd8team-java
   {% endif %}

java-common.alternatives:
  module.wait:
    - name:        state.sls
    - mods:        java-common.alternatives
    - kwargs:
        pillar:  {'java-common': {'pkg': {'name': '{{ name }}'}}}
    - watch:
      - pkg:       oracle-java7-installer
    - watch_in:
      - file:     /usr/bin/java
      - file:     /usr/bin/javac
