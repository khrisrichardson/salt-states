# vi: set ft=yaml.jinja :

{% from  'python-openssl/map.jinja'
   import python_openssl
   with   context %}

python-openssl:
  pkg.installed:
    - name:     {{ python_openssl['pkg']['name'] }}
