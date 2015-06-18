# vi: set ft=yaml.jinja :

{% set psls    = sls.split('.')[0] %}
{% set minions = salt['roles.dict']('kube-apiserver') %}

include:
  -  kube-scheduler
  -  supervisor

{% if minions['kube-apiserver'] %}

kube-scheduler:
  supervisord.running:
    - watch:
      - file:     /etc/default/kube-scheduler
      - file:     /usr/bin/kube-scheduler
      - service:   supervisor

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
