# vi: set ft=yaml.jinja :

{% set name    =  salt['config.get']('oracle-j2sdk1_6:pkg:name') %}
{% set version = 'cm4' %}

include:
  -  cloudera-{{ version }}
  -  java-common

{% if salt['config.get']('os_family') == 'Debian' %}

extend:
  accepted-oracle-license-v1-1-seen:
    cmd:
      - require_in:
        - pkg:     oracle-j2sdk1_6

{% endif %}

oracle-j2sdk1_6:
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
      - pkg:       oracle-j2sdk1_6
    - watch_in:
      - file:     /usr/bin/java
      - file:     /usr/bin/javac
