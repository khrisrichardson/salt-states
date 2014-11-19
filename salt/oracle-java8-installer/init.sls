# vi: set ft=yaml.jinja :

{% from 'oracle-java8-installer/map.jinja' import map with context %}

{% set name = map.get('pkg', {}).get('name') %}

include:
  -  java-common
  -  python-apt

{% if salt['config.get']('os_family') == 'Debian' %}

extend:
  accepted-oracle-license-v1-1-seen:
    cmd:
      - require_in:
        - pkg:     oracle-java8-installer

{% endif %}

oracle-java8-installer:
  pkg.installed:
    - name:     {{ name }}
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
      - pkg:       oracle-java8-installer
    - watch_in:
      - file:     /usr/bin/java
      - file:     /usr/bin/javac
