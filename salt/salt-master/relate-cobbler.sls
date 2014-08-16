# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('cobbler') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  salt-master

{% if minions['cobbler'] %}

/etc/salt/master.d/cobbler.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/master.d/cobbler.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       salt-master
    - watch_in:
      - service:   salt-master

{% else %}

/etc/salt/master.d/cobbler.conf:
  file.absent:
    - watch_in:
      - service:   salt-master

{% endif %}
