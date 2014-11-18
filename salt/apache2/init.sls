# vi: set ft=yaml.jinja :

{% from  'apache2/map.jinja'
   import apache2
   with   context %}

apache2:
  pkg.installed:
    - name:     {{ apache2['pkg']['name'] }}
  service.running:
    - name:     {{ apache2['service']['name'] }}
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       apache2

/etc/apache2/sites-enabled/000-default.conf:
  file.absent:
    - name:     {{ apache2['/etc/apache2/sites-enabled/000-default.conf']['file']['name'] }}
    - onlyif:      test -d /etc/apache2/sites-enabled
    - watch:
      - pkg:       apache2
    - watch_in:
      - service:   apache2
