# vi: set ft=yaml.jinja :

{% set psls    = sls.split('.')[0] %}
{% set minions = salt['roles.dict']('etcd') %}

include:
  -  kubernetes-proxy
  -  supervisor

{% if minions['etcd'] %}

kubernetes-proxy:
  supervisord.running:
    - watch:
      - file:     /etc/default/kubernetes-proxy
      - file:     /usr/bin/kubernetes-proxy
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
