# vi: set ft=yaml.jinja :

{% from 'linux-libc-dev/map.jinja' import map with context %}

linux-libc-dev:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
