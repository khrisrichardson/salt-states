# vi: set ft=yaml.jinja :

{% from 'python-pip/map.jinja' import map with context %}

python-pip:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
