# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  heat-api-cloudwatch
  -  supervisor

extend:
  heat-api-cloudwatch:
    supervisord.running:
      - watch:
        - pkg:     heat-api-cloudwatch
        - service: supervisor
#       - file:   /etc/heat/api-paste.ini
        - file:   /etc/heat/heat.conf
#       - file:   /etc/heat/policy.json

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
