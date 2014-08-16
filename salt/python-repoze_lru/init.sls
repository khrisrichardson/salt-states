# vi: set ft=yaml.jinja :

python-repoze_lru:
  pkg.installed:
    - name:     {{ salt['config.get']('python-repoze_lru:pkg:name') }}
