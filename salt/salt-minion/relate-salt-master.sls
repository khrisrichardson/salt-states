# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('salt-master') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  salt-minion

{% if minions['salt-master'] %}

/etc/salt/minion.d/salt-master.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/minion.d/salt-master.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/salt/minion.d
    - watch_in:
      - service:   salt-minion

{% endif %}
