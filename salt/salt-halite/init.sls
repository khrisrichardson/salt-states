# vi: set ft=yaml.jinja :

include:
# - .depend-git
  - .depend-openssl
# - .depend-supervisor
  -  python-gevent
  -  python-pip
  -  salt-common
  -  salt-master

salt-halite:
  pip.installed:
    - name:        halite
    - require:
      - pkg:       python-pip

/etc/salt/master.d/external_auth.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/salt/master.d/external_auth.conf
    - user:        root
    - group:       root
    - mode:       '0640'
    - require:
      - file:     /etc/salt/master.d
    - watch_in:
      - service:   salt-master

/etc/salt/master.d/salt-halite.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/salt/master.d/salt-halite.conf
    - user:        root
    - group:       root
    - mode:       '0640'
    - require:
      - file:     /etc/salt/master.d
    - watch_in:
      - service:   salt-master
