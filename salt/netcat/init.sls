# vi: set ft=yaml.jinja :

{% from  'netcat/map.jinja'
   import netcat
   with   context %}

netcat:
  pkg.installed:
    - name:     {{ netcat['pkg']['name'] }}
