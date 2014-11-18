# vi: set ft=yaml.jinja :

{% from  'libxslt1-dev/map.jinja'
   import libxslt1_dev
   with   context %}

libxslt1-dev:
  pkg.installed:
    - name:     {{ libxslt1_dev['pkg']['name'] }}
