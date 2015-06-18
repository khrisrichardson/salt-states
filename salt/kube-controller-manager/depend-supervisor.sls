# vi: set ft=yaml.jinja :

{% set psls    = sls.split('.')[0] %}
{% set minions = salt['roles.dict']('kube-apiserver') %}

include:
  -  kube-controller-manager
  -  supervisor

{% if minions['kube-apiserver'] %}

kube-controller-manager:
  supervisord.running:
    - watch:
      - file:     /etc/default/kube-controller-manager
      - file:     /usr/bin/kube-controller-manager
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
