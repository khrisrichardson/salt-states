# vi: set ft=yaml.jinja :

{% from 'libxslt1-dev/map.jinja' import map with context %}

libxslt1-dev:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
