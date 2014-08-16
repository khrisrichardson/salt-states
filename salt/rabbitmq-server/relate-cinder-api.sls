# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('cinder-api') %}

{% if minions['cinder-api'] %}

include:
  -  rabbitmq-server

cinder-rabbitmq_vhost:
  rabbitmq_vhost.present:
    - name:       /cinder
    - require:
      - service:   rabbitmq-server

cinder-rabbitmq_user:
  rabbitmq_user.present:
    - name:        cinder
    - password:    cinder
    - require:
      - service:   rabbitmq-server

#-------------------------------------------------------------------------------
# TODO: set permissions with rabbitmq_user state when that works
#-------------------------------------------------------------------------------

cinder-rabbitmq-permissions:
  cmd.run:
    - name:        rabbitmqctl       set_permissions -p /cinder cinder ".*" ".*" ".*"
    - unless:    |-
                 ( rabbitmqctl list_user_permissions            cinder         \
                 |       egrep                          /cinder                \
                 |       egrep -q '\.\*'
                 )
    - require:
      - rabbitmq_vhost:      cinder-rabbitmq_vhost
      - rabbitmq_user:       cinder-rabbitmq_user

{% endif %}
