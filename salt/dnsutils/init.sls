# vi: set ft=yaml.jinja :

{% from  'dnsutils/map.jinja'
   import dnsutils
   with   context %}

dnsutils:
  pkg.installed:
    - name:     {{ dnsutils['pkg']['name'] }}
