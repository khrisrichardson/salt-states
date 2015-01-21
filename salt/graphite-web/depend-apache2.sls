# vi: set ft=yaml.jinja :

{% from 'apache2/map.jinja' import map with context %}

include:
  -  apache2
  -  graphite-web
  -  graphite-web.depend-libapache2-mod-wsgi

extend:
  graphite-web:
    pkg:
      - watch_in:
        - service: apache2

  /etc/graphite/local_settings.py:
    file:
      - watch_in:
        - service: apache2

  python graphite/manage.py syncdb --noinput:
    cmd:
      - watch_in:
        - service: apache2

/etc/apache2/mods-enabled/headers.load:
  file.symlink:
    - target:     /etc/apache2/mods-available/headers.load
    - onlyif:      test -d /etc/apache2/mods-enabled
    - require:
      - pkg:       apache2
    - watch_in:
      - service:   apache2

/etc/apache2/sites-enabled/000-cors.conf:
  file.managed:
    - name:     {{ map.get('/etc/apache2/sites-enabled', {}).get('file', {}).get('name') }}/000-cors.conf
    - contents:  |-
                   Header set Access-Control-Allow-Origin     "*"
                   Header set Access-Control-Allow-Methods    "GET, OPTIONS"
                   Header set Access-Control-Allow-Headers    "origin, authorization, accept"
                   Header set Access-Control-Allow-Credentials true
    - watch:
      - pkg:       apache2
    - watch_in:
      - service:   apache2

/etc/apache2/sites-enabled/graphite-web:
  file.symlink:
    - target:     /usr/share/graphite-web/apache2-graphite.conf
    - onlyif:      test -d /etc/apache2/sites-enabled
    - require:
      - pkg:       graphite-web
    - watch_in:
      - service:   apache2
