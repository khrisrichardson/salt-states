# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  fleet
  -  supervisor

fleet:
  supervisord.running:
    - watch:
      - service:   supervisor
      - file:     /etc/fleet/fleet.conf
      - file:     /usr/bin/fleet
#     - cmd:       go get fleet

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
