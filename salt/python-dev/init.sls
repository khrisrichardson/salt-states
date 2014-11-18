# vi: set ft=yaml.jinja :

{% from  'python-dev/map.jinja'
   import python_dev
   with   context %}

python-dev:
  pkg.installed:
    - name:     {{ python_dev['pkg']['name'] }}
