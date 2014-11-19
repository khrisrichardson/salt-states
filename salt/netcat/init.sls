# vi: set ft=yaml.jinja :

{% from 'netcat/map.jinja' import map with context %}

netcat:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
