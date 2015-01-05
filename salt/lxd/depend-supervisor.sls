# vi: set ft=yaml.jinja :

{% set psls    = sls.split('.')[0] %}

include:
  -  lxd
  -  supervisor

extend:
  lxd:
    supervisord.running:
      - watch:
        - service: supervisor
        - cmd:     go build lxd

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
