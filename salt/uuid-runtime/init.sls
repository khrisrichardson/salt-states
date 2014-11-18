# vi: set ft=yaml.jinja :

{% from  'uuid-runtime/map.jinja'
   import uuid_runtime
   with   context %}

uuid-runtime:
  pkg.installed:
    - name:     {{ uuid_runtime['pkg']['name'] }}
