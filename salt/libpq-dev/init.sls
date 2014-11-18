# vi: set ft=yaml.jinja :

{% from  'libpq-dev/map.jinja'
   import libpq_dev
   with   context %}

libpq-dev:
  pkg.installed:
    - name:     {{ libpq_dev['pkg']['name'] }}
