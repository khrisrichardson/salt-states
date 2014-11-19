# vi: set ft=yaml.jinja :

{% from 'libpq-dev/map.jinja' import map with context %}

libpq-dev:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
