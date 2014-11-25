# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  cinder-scheduler
  -  supervisor

extend:
  cinder-scheduler:
    supervisord.running:
      - require:
        - file:   /var/lock/cinder
        - file:   /var/run/cinder
      - watch:
        - pkg:     cinder-scheduler
        - service: supervisor
#       - file:   /etc/cinder/api-paste.ini
        - file:   /etc/cinder/cinder.conf
#       - file:   /etc/cinder/logging.conf
#       - file:   /etc/cinder/policy.json

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

{% endif %}
