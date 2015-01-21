# vi: set ft=yaml.jinja :

{% from 'graphite-web/map.jinja' import map with context %}

{% set etc = map.get('/etc/graphite', {}).get('file', {}).get('name') %}
{% set grp = map.get('group', {}).get('name') %}
{% set usr = map.get('user', {}).get('name') %}
{% set py  = salt['config.get']('saltpath').split('/')[:-1]|join('/') %}

include:
  - .depend-nginx
  - .depend-sqlite3
  -  graphite-carbon
  -  postfix
# -  python-es
  -  python-ldap
  -  python-whisper

graphite-web:
  pkg.installed:   []

#-------------------------------------------------------------------------------
# TODO: use Debian file as origin
#-------------------------------------------------------------------------------

/etc/graphite/local_settings.py:
  file.managed:
    - name:     {{ etc }}/local_settings.py
    - template:    jinja
    - source:      salt://{{ sls }}/etc/graphite/local_settings.py
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       graphite-web

python graphite/manage.py syncdb --noinput:
  cmd.run:
    - cwd:      {{ py }}
    - user:     {{ usr }}
    - group:    {{ grp }}
    - watch:
      - file:     /etc/graphite/local_settings.py
      - file:     /usr/lib/python2.7/dist-packages/graphite/settings.py
