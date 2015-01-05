# vi: set ft=yaml.jinja :

{% from 'ivy/map.jinja' import map with context %}

ivy:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
