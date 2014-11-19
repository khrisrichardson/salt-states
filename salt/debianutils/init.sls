# vi: set ft=yaml.jinja :

{% from 'debianutils/map.jinja' import map with context %}

debianutils:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
