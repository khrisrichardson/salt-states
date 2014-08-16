# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('ceilometer-api') %}

{% if minions['ceilometer-api'] %}

include:
  -  rabbitmq-server

ceilometer-rabbitmq_vhost:
  rabbitmq_vhost.present:
    - name:       /ceilometer
    - require:
      - service:   rabbitmq-server

ceilometer-rabbitmq_user:
  rabbitmq_user.present:
    - name:        ceilometer
    - password:    ceilometer
    - require:
      - service:   rabbitmq-server

#-------------------------------------------------------------------------------
# TODO: set permissions with rabbitmq_user state when that works
#-------------------------------------------------------------------------------

ceilometer-rabbitmq-permissions:
  cmd.run:
    - name:        rabbitmqctl       set_permissions -p /ceilometer ceilometer ".*" ".*" ".*"
    - unless:    |-
                 ( rabbitmqctl list_user_permissions                ceilometer \
                 |       egrep                          /ceilometer            \
                 |       egrep -q '\.\*'
                 )
    - require:
      - rabbitmq_vhost:      ceilometer-rabbitmq_vhost
      - rabbitmq_user:       ceilometer-rabbitmq_user

{% endif %}
