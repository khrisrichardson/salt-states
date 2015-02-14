# vi: set ft=yaml.jinja :

{% from 'openjdk-7-jdk/map.jinja' import map with context %}

openjdk-7-jdk:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
