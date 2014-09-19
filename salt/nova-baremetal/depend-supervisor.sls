# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  nova-baremetal
  -  supervisor

extend:
  nova-baremetal:
    supervisord.running:
      - require:
        - file:   /var/lock/nova
        - file:   /var/run/nova
      - watch:
        - pkg:     nova-baremetal
        - service: supervisor
#       - file:   /etc/nova/api-paste.ini
#       - file:   /etc/nova/logging.conf
        - file:   /etc/nova/nova.conf
#       - file:   /etc/nova/policy.json

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

{% endif %}
