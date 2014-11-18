# vi: set ft=yaml.jinja :

{% from  'nagios3/map.jinja'
   import nagios3
   with   context %}

include:
  - .depend-nginx
  -  postfix

nagios3:
  pkg.installed:
   - name:      {{ nagios3['pkg']['name'] }}
  service.running:
    - name:     {{ nagios3['service']['name'] }}
    - enable:      True
    - watch:
      - pkg:       nagios3
