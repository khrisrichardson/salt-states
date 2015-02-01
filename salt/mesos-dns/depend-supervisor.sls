# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mesos-master') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  mesos-dns
  -  supervisor

mesos-dns:
  supervisord.running:
    - watch:
      - service:   supervisor
      - file:     /usr/bin/mesos-dns
     {% if minions['mesos-master'] %}
      - file:     /etc/mesos-dns/config.json
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
