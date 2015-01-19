# vi: set ft=yaml.jinja :

{% set minions  = salt['roles.dict']('consul-server') %}
{% set nodename = salt['config.get']('nodename') %}

include:
  -  consul-client

{% if minions['consul-server'] %}

consul join {{ minions['consul-server'][0] }}:
  cmd.run:
    - unless:    |-
                 ( consul members -detailed                                    \
                 | grep ^{{ nodename }}
                 )
    - require:
      - supervisord:    consul-client

{% endif %}
