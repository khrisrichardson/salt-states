# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mysql-server') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  python-mysqldb
  -  salt-minion

{% if minions['mysql-server'] %}

/etc/salt/minion.d/mysql-server.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/minion.d/mysql-server.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       python-mysqldb
      - file:     /etc/salt/minion.d
    - watch_in:
      - service:   salt-minion

{% endif %}
