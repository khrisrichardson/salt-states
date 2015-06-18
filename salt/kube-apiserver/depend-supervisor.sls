# vi: set ft=yaml.jinja :

{% set psls  = sls.split('.')[0] %}
{% set roles = [] %}
{% do  roles.append('etcd') %}
{% do  roles.append('kubelet') %}
{% set minions = salt['roles.dict'](roles) %}

include:
  -  kube-apiserver
  -  supervisor

{% if  minions['etcd']
   and minions['kubelet'] %}

kube-apiserver:
  supervisord.running:
    - watch:
      - file:     /etc/default/kube-apiserver
      - file:     /usr/bin/kube-apiserver
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
