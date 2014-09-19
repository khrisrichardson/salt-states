# vi: set ft=yaml.jinja :

{% set etc = salt['config.get']('/etc/graphite:file:name') %}

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
