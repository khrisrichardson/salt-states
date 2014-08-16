# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('neutron-server') %}

{% if minions['neutron-server'] %}

include:
  -  rabbitmq-server

neutron-rabbitmq_vhost:
  rabbitmq_vhost.present:
    - name:       /neutron
    - require:
      - service:   rabbitmq-server

neutron-rabbitmq_user:
  rabbitmq_user.present:
    - name:        neutron
    - password:    neutron
    - require:
      - service:   rabbitmq-server

#-------------------------------------------------------------------------------
# TODO: set permissions with rabbitmq_user state when that works
#-------------------------------------------------------------------------------

neutron-rabbitmq-permissions:
  cmd.run:
    - name:        rabbitmqctl       set_permissions -p /neutron neutron ".*" ".*" ".*"
    - unless:    |-
                 ( rabbitmqctl list_user_permissions             neutron       \
                 |       egrep                          /neutron               \
                 |       egrep -q '\.\*'
                 )
    - require:
      - rabbitmq_vhost:      neutron-rabbitmq_vhost
      - rabbitmq_user:       neutron-rabbitmq_user

{% endif %}
