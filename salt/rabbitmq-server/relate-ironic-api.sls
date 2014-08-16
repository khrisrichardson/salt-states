# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('ironic-api') %}

{% if minions['ironic-api'] %}

include:
  -  rabbitmq-server

ironic-rabbitmq_vhost:
  rabbitmq_vhost.present:
    - name:       /ironic
    - require:
      - service:   rabbitmq-server

ironic-rabbitmq_user:
  rabbitmq_user.present:
    - name:        ironic
    - password:    ironic
    - require:
      - service:   rabbitmq-server

#-------------------------------------------------------------------------------
# TODO: set permissions with rabbitmq_user state when that works
#-------------------------------------------------------------------------------

ironic-rabbitmq-permissions:
  cmd.run:
    - name:        rabbitmqctl       set_permissions -p /ironic ironic ".*" ".*" ".*"
    - unless:    |-
                 ( rabbitmqctl list_user_permissions            ironic         \
                 |       egrep                          /ironic                \
                 |       egrep -q '\.\*'
                 )
    - require:
      - rabbitmq_vhost:      ironic-rabbitmq_vhost
      - rabbitmq_user:       ironic-rabbitmq_user

{% endif %}
