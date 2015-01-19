# vi: set ft=yaml.jinja :

{% set family = salt['config.get']('os_family')|lower %}

include:
  -  python-apt

rabbitmq-server:
{% if salt['config.get']('os_family') == 'Debian' %}
  pkgrepo.managed:
    - humanname:   RabbitMQ
    - name:        deb http://www.rabbitmq.com/{{ family }}/ testing main
    - file:       /etc/apt/sources.list.d/rabbitmq.list
    - key_url:     http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
    - require:
      - pkg:       python-apt
    - require_in:
      - pkg:       rabbitmq-server
{% endif %}
  pkg.installed:   []
  service.running:
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       rabbitmq-server

/etc/rabbitmq/rabbitmq.config:
  file.managed:
    - contents:  |-
                 [
                     {rabbit, [
                     {ssl_listeners, [5671]}
                   ]}
                 ].
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       rabbitmq-server
    - watch_in:
      - service:   rabbitmq-server

#-------------------------------------------------------------------------------
# TODO: use rabbitmq.join_cluster function
# TODO: switch to more idiomatic plugin management after hydrogen release
#-------------------------------------------------------------------------------

#rabbitmq_management:
# rabbitmq_plugin.enabled    []

rabbitmq-plugins enable rabbitmq_management:
  cmd.run:
    - env:
      - HOME:     /usr/lib/rabbitmq
      - PATH:     /usr/lib/rabbitmq/bin:/bin:/usr/bin
    - unless:    |-
                 ( rabbitmq-plugins list -m -E rabbitmq_management             \
                 |            egrep         -q rabbitmq_management
                 )
    - watch_in:
      - service:   rabbitmq-server
