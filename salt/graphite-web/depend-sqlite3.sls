# vi: set ft=yaml.jinja :

{% from 'graphite-web/map.jinja' import map with context %}

{% set etc = map.get('/etc/graphite', {}).get('file', {}).get('name') %}
{% set grp = map.get('group', {}).get('name') %}
{% set lib = map.get('/var/lib/graphite', {}).get('file', {}).get('name') %}
{% set usr = map.get('user', {}).get('name') %}
{% set py  = salt['config.get']('saltpath') + '/../graphite' %}

include:
  -  graphite-web

/usr/lib/python2.7/dist-packages/graphite/settings.py:
  file.replace:
    - name:     {{ py }}/settings.py
    - pattern:   "'NAME': '',"
    - repl:      "'NAME': '{{ lib }}/graphite.db',"
    - watch:
      - pkg:       graphite-web

python manage.py syncdb --noinput:
  cmd.run:
    - cwd:      {{ py }}
    - user:     {{ usr }}
    - group:    {{ grp }}
    - unless:    |-
                 (  [    {{ lib }}/graphite.db -nt {{ etc }}/local_settings.py ] \
                 || [ -s {{ lib }}/graphite.db ]
                 )
    - watch:
      - file:     /etc/graphite/local_settings.py
      - file:     /usr/lib/python2.7/dist-packages/graphite/settings.py
