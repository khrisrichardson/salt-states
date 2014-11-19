# vi: set ft=yaml.jinja :

{% from 'apache2/map.jinja' import map with context %}

apache2:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       apache2

/etc/apache2/sites-enabled/000-default.conf:
  file.absent:
    - name:     {{ map.get('/etc/apache2/sites-enabled/000-default.conf', {}).get('file', {}).get('name') }}
    - onlyif:      test -d /etc/apache2/sites-enabled
    - watch:
      - pkg:       apache2
    - watch_in:
      - service:   apache2
