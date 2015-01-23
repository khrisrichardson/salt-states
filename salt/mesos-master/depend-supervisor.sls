# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('zookeeper-server') %}
{% set psls    = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  mesos-master
  -  supervisor

extend:
  mesos-master:
    supervisord.running:
      - watch:
        - pkg:     mesos
        - service: supervisor
       {% if minions['zookeeper-server'] %}
        - file:   /etc/mesos/zk
       {% endif %}
        - file:   /etc/mesos-master/quorum

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
