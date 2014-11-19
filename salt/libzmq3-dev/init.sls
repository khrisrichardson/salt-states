# vi: set ft=yaml.jinja :

{% from 'libzmq3-dev/map.jinja' import map with context %}

libzmq3-dev:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
