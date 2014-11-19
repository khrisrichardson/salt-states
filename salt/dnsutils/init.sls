# vi: set ft=yaml.jinja :

{% from 'dnsutils/map.jinja' import map with context %}

dnsutils:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
