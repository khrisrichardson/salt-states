# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  supervisor
  -  trove-guestagent

extend:
  trove-guestagent:
    supervisord.running:
      - watch:
        - pkg:     trove-guestagent
        - service: supervisor
        - file:   /etc/trove/trove.conf

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
