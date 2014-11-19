# vi: set ft=yaml.jinja :

{% from 'apache2/map.jinja' import map with context %}

{% set psls = sls.split('.')[0] %}

include:
  -  apache2
  -  calamari.depend-libapache2-mod-wsgi

/etc/apache2/sites-available/{{ psls }}:
  file.managed:
    - template:    jinja
    - name:     {{ map.get('/etc/apache2/sites-available', {}).get('file', {}).get('name') }}/{{ psls }}{{ map.get('conf', {}).get('extension') }}
    - source:      salt://{{ psls }}/etc/apache2/sites-available/{{ psls }}
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       apache2
    - watch_in:
      - service:   apache2

/etc/apache2/sites-enabled/calamari:
  file.symlink:
    - target:     /etc/apache2/sites-available/{{ psls }}
    - onlyif:      test -d /etc/apache2/sites-enabled
    - require:
      - file:     /etc/apache2/sites-available/{{ psls }}
