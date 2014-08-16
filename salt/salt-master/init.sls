# vi: set ft=yaml.jinja :

include:
  - .depend-git
  - .depend-supervisor
  -  salt-common

salt-master:
  pkg.installed:
    - enablerepo:  epel-testing
    - unless:    |-
                 ( salt-master --version                                       \
                 | egrep -q '....\..\..+-'
                 )
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
    - reload:      True
{% endif %}
    - order:      -1
    - sig:        'salt-master -d'
    - watch:
      - pkg:       salt-master

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

/etc/salt/master.d/auto_accept.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/salt/master.d/auto_accept.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       salt-master
    - watch_in:
      - service:   salt-master

{% endif %}

/etc/salt/master.d/file_recv.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/salt/master.d/file_recv.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       salt-master
    - watch_in:
      - service:   salt-master

/etc/salt/master.d/peer.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/salt/master.d/peer.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       salt-master
    - watch_in:
      - service:   salt-master

/etc/salt/master.d/presence.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/salt/master.d/presence.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       salt-master
    - watch_in:
      - service:   salt-master

/etc/salt/master.d/reactor.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/salt/master.d/reactor.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       salt-master
      - file:     /srv/reactor/job/ret.sls
      - file:     /srv/reactor/minion/start.sls
    - watch_in:
      - service:   salt-master

/srv/reactor:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'

/srv/reactor/job:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /srv/reactor

/srv/reactor/job/ret.sls:
  file.managed:
    - source:      salt://{{ sls }}/srv/reactor/job/ret.sls
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /srv/reactor/job

/srv/reactor/minion:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /srv/reactor

/srv/reactor/minion/start.sls:
  file.managed:
    - source:      salt://{{ sls }}/srv/reactor/minion/start.sls
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /srv/reactor/minion
