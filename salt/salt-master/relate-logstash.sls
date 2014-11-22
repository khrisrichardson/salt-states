# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('logstash') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  salt-master

{% if minions['logstash'] %}

/etc/salt/master.d/log.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/master.d/log.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/salt/master.d
    - watch_in:
      - service:   salt-master

{% else %}

/etc/salt/master.d/log.conf:
  file.absent:
    - watch_in:
      - service:   salt-master

{% endif %}
