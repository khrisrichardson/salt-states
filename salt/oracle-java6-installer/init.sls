# vi: set ft=yaml.jinja :

{% from  'oracle-java6-installer/map.jinja'
   import oracle_java6_installer
   with   context %}

{% set name = oracle_java6_installer['pkg']['name'] %}

include:
  -  java-common
  -  python-apt

{% if salt['config.get']('os_family') == 'Debian' %}

extend:
  accepted-oracle-license-v1-1-seen:
    cmd:
      - require_in:
        - pkg:     oracle-java6-installer

{% endif %}

oracle-java6-installer:
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
      - pkg:       oracle-java6-installer
    - watch_in:
      - file:     /usr/bin/java
      - file:     /usr/bin/javac
