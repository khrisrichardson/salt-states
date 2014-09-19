# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  supervisor
  -  swift-object-expirer

extend:
  swift-object-expirer:
    supervisord.running:
      - watch:
        - pkg:     swift-object-expirer
        - service: supervisor
        - file:   /etc/swift/object-expirer.conf
        - file:   /etc/swift/swift.conf

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
