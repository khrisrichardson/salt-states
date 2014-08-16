# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('sensu-server') %}

{% if minions['sensu-server'] %}

include:
  -  rabbitmq-server

sensu-rabbitmq_vhost:
  rabbitmq_vhost.present:
    - name:       /sensu
    - require:
      - service:   rabbitmq-server

sensu-rabbitmq_user:
  rabbitmq_user.present:
    - name:        sensu
    - password:    mypass
    - require:
      - service:   rabbitmq-server

#-------------------------------------------------------------------------------
# TODO: set permissions with rabbitmq_user state when that works
#-------------------------------------------------------------------------------

sensu-rabbitmq-permissions:
  cmd.run:
    - name:        rabbitmqctl       set_permissions -p /sensu sensu ".*" ".*" ".*"
    - unless:    |-
                 ( rabbitmqctl list_user_permissions           sensu           \
                 |       egrep                          /sensu                 \
                 |       egrep -q '\.\*'
                 )
    - require:
      - rabbitmq_vhost:      sensu-rabbitmq_vhost
      - rabbitmq_user:       sensu-rabbitmq_user

{% endif %}
