# vi: set ft=yaml.jinja :

{% from 'libxml2-dev/map.jinja' import map with context %}

libxml2-dev:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
