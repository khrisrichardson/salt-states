# vi: set ft=yaml.jinja :

{% from 'graphite-web/map.jinja' import map with context %}

{% set etc = map.get('/etc/graphite', {}).get('file', {}).get('name') %}
{% set lib = map.get('/var/lib/graphite', {}).get('file', {}).get('name') %}
{% set py  = salt['config.get']('saltpath').split('/')[:-1]|join('/') %}


include:
  -  graphite-web

extend:
  python graphite/manage.py syncdb --noinput:
    cmd.run:
      - unless:  |-
                 (  [    {{ lib }}/graphite.db -nt {{ etc }}/local_settings.py ] \
                 || [ -s {{ lib }}/graphite.db ]
                 )

/usr/lib/python2.7/dist-packages/graphite/settings.py:
  file.replace:
    - name:     {{ py }}/graphite/settings.py
    - pattern:   "'NAME': '',"
    - repl:      "'NAME': '{{ lib }}/graphite.db',"
    - watch:
      - pkg:       graphite-web
