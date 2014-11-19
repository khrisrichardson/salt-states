# vi: set ft=yaml.jinja :

{% from 'graphite-web/map.jinja' import map with context %}

{% set etc = map.get('/etc/graphite', {}).get('file', {}).get('name') %}

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
