# vi: set ft=yaml.jinja :

{% from 'oracle-j2sdk1_7/map.jinja' import map with context %}

{% set name    =  map.get('pkg', {}).get('name') %}
{% set version = 'cm5' %}

include:
  -  cloudera-{{ version }}
  -  java-common

{% if salt['config.get']('os_family') == 'Debian' %}

extend:
  accepted-oracle-license-v1-1-seen:
    cmd:
      - require_in:
        - pkg:     oracle-j2sdk1_7

{% endif %}

oracle-j2sdk1_7:
  pkg.installed:
    - name:     {{ name }}
    - require:
      - pkgrepo:   cloudera-{{ version }}

java-common.alternatives:
  module.wait:
    - name:        state.sls
    - mods:        java-common.alternatives
    - kwargs:
        pillar:  {'java-common': {'pkg': {'name': '{{ name }}'}}}
    - watch:
      - pkg:       oracle-j2sdk1_7
    - watch_in:
      - file:     /usr/bin/java
      - file:     /usr/bin/javac
