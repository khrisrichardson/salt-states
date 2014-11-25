# vi: set ft=yaml.jinja :

{% set psls  = sls.split('.')[0] %}
{% set roles = [] %}
{% do  roles.append('etcd') %}
{% do  roles.append('kubernetes-kubelet') %}
{% set minions = salt['roles.dict'](roles) %}

include:
  -  kubernetes-apiserver
  -  supervisor

{% if  minions['etcd']
   and minions['kubernetes-kubelet'] %}

kubernetes-apiserver:
  supervisord.running:
    - watch:
      - file:     /etc/default/kubernetes-apiserver
      - file:     /usr/bin/kubernetes-apiserver
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
      - cmd:       supervisorctl update
