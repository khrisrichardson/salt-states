# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('heat-api') %}

{% if minions['heat-api'] %}

include:
  -  rabbitmq-server

heat-rabbitmq_vhost:
  rabbitmq_vhost.present:
    - name:       /heat
    - require:
      - service:   rabbitmq-server

heat-rabbitmq_user:
  rabbitmq_user.present:
    - name:        heat
    - password:    heat
    - require:
      - service:   rabbitmq-server

#-------------------------------------------------------------------------------
# TODO: set permissions with rabbitmq_user state when that works
#-------------------------------------------------------------------------------

heat-rabbitmq-permissions:
  cmd.run:
    - name:        rabbitmqctl       set_permissions -p /heat heat ".*" ".*" ".*"
    - unless:    |-
                 ( rabbitmqctl list_user_permissions          heat             \
                 |       egrep                          /heat                  \
                 |       egrep -q '\.\*'
                 )
    - require:
      - rabbitmq_vhost:      heat-rabbitmq_vhost
      - rabbitmq_user:       heat-rabbitmq_user

{% endif %}
