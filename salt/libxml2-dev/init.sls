# vi: set ft=yaml.jinja :

{% from  'libxml2-dev/map.jinja'
   import libxml2_dev
   with   context %}

libxml2-dev:
  pkg.installed:
    - name:     {{ libxml2_dev['pkg']['name'] }}
