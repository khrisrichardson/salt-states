# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('redis-server') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  python-redis
  -  salt-minion

{% if minions['redis-server'] %}

/etc/salt/minion.d/redis-server.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/minion.d/redis-server.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       python-redis
      - file:     /etc/salt/minion.d
    - watch_in:
      - service:   salt-minion

{% endif %}
