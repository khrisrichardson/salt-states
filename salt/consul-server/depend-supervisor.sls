# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  consul
  -  supervisor

consul-server:
  supervisord.running:
    - require:
      - file:     /usr/bin/consul
      - file:     /var/lib/consul
    - watch:
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
      - cmd:       supervisorctl update &
