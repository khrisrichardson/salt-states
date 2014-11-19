# vi: set ft=yaml.jinja :

{% from 'nagios3/map.jinja' import map with context %}

include:
  - .depend-nginx
  -  postfix

nagios3:
  pkg.installed:
   - name:      {{ map.get('pkg', {}).get('name') }}
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - watch:
      - pkg:       nagios3
