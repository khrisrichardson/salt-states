# vi: set ft=yaml.jinja :

include:
  - .depend-nginx
  -  postfix

nagios3:
  pkg.installed:
   - name:      {{ salt['config.get']('nagios3:pkg:name') }}
  service.running:
    - name:     {{ salt['config.get']('nagios3:service:name') }}
    - enable:      True
    - watch:
      - pkg:       nagios3
