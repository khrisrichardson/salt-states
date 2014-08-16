# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('keystone') %}

{% if minions['keystone'] %}

include:
  -  rabbitmq-server

keystone-rabbitmq_vhost:
  rabbitmq_vhost.present:
    - name:       /keystone
    - require:
      - service:   rabbitmq-server

keystone-rabbitmq_user:
  rabbitmq_user.present:
    - name:        keystone
    - password:    keystone
    - require:
      - service:   rabbitmq-server

#-------------------------------------------------------------------------------
# TODO: set permissions with rabbitmq_user state when that works
#-------------------------------------------------------------------------------

keystone-rabbitmq-permissions:
  cmd.run:
    - name:        rabbitmqctl       set_permissions -p /keystone keystone ".*" ".*" ".*"
    - unless:    |-
                 ( rabbitmqctl list_user_permissions              keystone     \
                 |       egrep                          /keystone              \
                 |       egrep -q '\.\*'
                 )
    - require:
      - rabbitmq_vhost:      keystone-rabbitmq_vhost
      - rabbitmq_user:       keystone-rabbitmq_user

{% endif %}
