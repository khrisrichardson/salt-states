# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('zookeeper-server') %}
{% set psls    = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  mesos-slave
  -  supervisor

extend:
  mesos-slave:
    supervisord.running:
      - watch:
        - pkg:     mesos
        - service: supervisor
        - file:   /etc/mesos-slave/containerizers
        - file:   /etc/mesos-slave/executor_registration_timeout
       {% if minions['zookeeper-server'] %}
        - file:   /etc/mesos/zk
       {% endif %}

/etc/supervisor/conf.d/{{ psls }}.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/supervisor/conf.d/{{ psls }}.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /usr/bin/supervisord
    - require_in:
      - service:   supervisor
    - watch_in:
      - cmd:       supervisorctl update &

{% endif %}
