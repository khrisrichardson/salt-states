# vi: set ft=yaml.jinja :

{% from 'uuid-runtime/map.jinja' import map with context %}

uuid-runtime:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
