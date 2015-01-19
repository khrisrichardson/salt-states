# vi: set ft=yaml.jinja :

{% from 'libzmq3/map.jinja' import map with context %}

libzmq3:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
