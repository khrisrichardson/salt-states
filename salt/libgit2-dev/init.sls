# vi: set ft=yaml.jinja :

{% from 'libgit2-dev/map.jinja' import map with context %}

libgit2-dev:
  pkg.latest:
    - name:     {{ map.get('pkg', {}).get('name') }}
