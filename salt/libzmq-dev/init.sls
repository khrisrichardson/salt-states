# vi: set ft=yaml.jinja :

{% from 'libzmq-dev/map.jinja' import map with context %}

libzmq-dev:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
