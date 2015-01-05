# vi: set ft=yaml.jinja :

{% from 'lxc-dev/map.jinja' import map with context %}

lxc-dev:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
