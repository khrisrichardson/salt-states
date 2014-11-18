# vi: set ft=yaml.jinja :

{% from  'python-protobuf/map.jinja'
   import python_protobuf
   with   context %}

python-protobuf:
  pkg.installed:
    - name:     {{ python_protobuf['pkg']['name'] }}
