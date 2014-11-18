# vi: set ft=yaml.jinja :

{% from  'python-repoze_lru/map.jinja'
   import python_repoze_lru
   with   context %}

python-repoze_lru:
  pkg.installed:
    - name:     {{ python_repoze_lru['pkg']['name'] }}
