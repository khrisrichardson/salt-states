# vi: set ft=yaml.jinja :

{% from 'python-repoze_lru/map.jinja' import map with context %}

python-repoze_lru:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
