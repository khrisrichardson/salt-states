# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('etcd') %}
{% set psls    = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  salt-minion
  -  supervisor
  {% if minions['etcd'] %}
  -  salt-minion.relate-etcd
  {% endif %}

extend:
  salt-minion:
    supervisord.running:
      - order:     1
      - watch:
        - pkg:     salt-minion
        - service: supervisor
        - file:   /etc/salt/minion.d/master.conf
        - file:   /etc/salt/minion.d/schedule.conf
       {% if minions['etcd'] %}
        - file:   /etc/salt/minion.d/etcd.conf
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
