# vi: set ft=yaml.jinja :

{% from 'python-dev/map.jinja' import map with context %}

python-dev:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
