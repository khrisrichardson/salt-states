# vi: set ft=yaml.jinja :

{% set psls    = sls.split('.')[0] %}
{% set minions = salt['roles.dict']('kubernetes-apiserver') %}

include:
  -  kubernetes-controller-manager
  -  supervisor

{% if minions['kubernetes-apiserver'] %}

kubernetes-controller-manager:
  supervisord.running:
    - watch:
      - file:     /etc/default/kubernetes-controller-manager
      - file:     /usr/bin/kubernetes-controller-manager
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
