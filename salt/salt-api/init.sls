# vi: set ft=yaml.jinja :

include:
  - .depend-openssl
  -  python-cherrypy
  -  salt-master

salt-api:
  service.running:
    - enable:      True
    - watch:
      - pkg:       salt-master

/etc/salt/master.d/salt-api.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/salt/master.d/salt-api.conf
    - user:        root
    - group:       root
    - mode:       '0640'
    - require:
      - file:     /etc/salt/master.d
    - watch_in:
      - service:   salt-master
      - service:   salt-api
