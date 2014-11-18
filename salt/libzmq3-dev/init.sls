# vi: set ft=yaml.jinja :

{% from  'libzmq3-dev/map.jinja'
   import libzmq3_dev
   with   context %}

libzmq3-dev:
  pkg.installed:
    - name:     {{ libzmq3_dev['pkg']['name'] }}
