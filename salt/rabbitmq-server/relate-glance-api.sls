# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('glance-api') %}

{% if minions['glance-api'] %}

include:
  -  rabbitmq-server

glance-rabbitmq_vhost:
  rabbitmq_vhost.present:
    - name:       /glance
    - require:
      - service:   rabbitmq-server

glance-rabbitmq_user:
  rabbitmq_user.present:
    - name:        glance
    - password:    glance
    - require:
      - service:   rabbitmq-server

#-------------------------------------------------------------------------------
# TODO: set permissions with rabbitmq_user state when that works
#-------------------------------------------------------------------------------

glance-rabbitmq-permissions:
  cmd.run:
    - name:        rabbitmqctl       set_permissions -p /glance glance ".*" ".*" ".*"
    - unless:    |-
                 ( rabbitmqctl list_user_permissions            glance         \
                 |       egrep                          /glance                \
                 |       egrep -q '\.\*'
                 )
    - require:
      - rabbitmq_vhost:      glance-rabbitmq_vhost
      - rabbitmq_user:       glance-rabbitmq_user

{% endif %}
