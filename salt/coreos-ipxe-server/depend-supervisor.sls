# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  coreos-ipxe-server
  -  supervisor

coreos-ipxe-server:
  supervisord.running:
    - watch:
      - file:     /opt/coreos-ipxe-server/bin/coreos-ipxe-server
      - service:   supervisor

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
