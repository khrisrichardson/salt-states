# vi: set ft=yaml.jinja :

{% from 'python-openssl/map.jinja' import map with context %}

python-openssl:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
