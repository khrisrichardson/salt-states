# vi: set ft=yaml.jinja :

{% from 'python-protobuf/map.jinja' import map with context %}

python-protobuf:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
