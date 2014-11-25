# vi: set ft=yaml.jinja :

{% set psls  = sls.split('.')[0] %}
{% set roles = [] %}
{% do  roles.append('cobbler') %}
{% do  roles.append('etcd') %}
{% do  roles.append('logstash') %}
{% set minions = salt['roles.dict'](roles) %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  salt-master
  -  supervisor
  {% if minions['cobbler'] %}
  -  salt-master.relate-cobbler
  {% endif %}
  {% if minions['etcd'] %}
  -  salt-master.relate-etcd
  {% endif %}
  {% if minions['logstash'] %}
  -  salt-master.relate-logstash
  {% endif %}

extend:
  salt-master:
    supervisord.running:
      - order:    -1
      - watch:
        - pkg:     salt-master
        - service: supervisor
        - file:   /etc/salt/master.d/auto_accept.conf
        - file:   /etc/salt/master.d/file_recv.conf
        - file:   /etc/salt/master.d/fileserver_backend.conf
        - file:   /etc/salt/master.d/peer.conf
        - file:   /etc/salt/master.d/presence.conf
        - file:   /etc/salt/master.d/reactor.conf
       {% if minions['cobbler'] %}
        - file:   /etc/salt/master.d/cobbler.conf
       {% endif %}
       {% if minions['etcd'] %}
        - file:   /etc/salt/master.d/etcd.conf
       {% endif %}
       {% if minions['logstash'] %}
        - file:   /etc/salt/master.d/log.conf
       {% endif %}

/etc/supervisor/conf.d/{{ psls }}.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/supervisor/conf.d/{{ psls }}.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/supervisor/conf.d
    - require_in:
      - service:   supervisor
    - watch_in:
      - cmd:       supervisorctl update

{% endif %}
