# vi: set ft=yaml.jinja :

{% from 'openjdk-7-jre-headless/map.jinja' import map with context %}

openjdk-7-jre-headless:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
