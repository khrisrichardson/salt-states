# vi: set ft=yaml.jinja :

{% from  'debianutils/map.jinja'
   import debianutils
   with   context %}

debianutils:
  pkg.installed:
    - name:     {{ debianutils['pkg']['name'] }}
