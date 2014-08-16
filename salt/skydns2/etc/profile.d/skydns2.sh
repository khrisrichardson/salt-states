# vi: set ft=bash.jinja :
{% set minions = salt['roles.dict']('etcd') -%}

#-------------------------------------------------------------------------------
# TODO: switch to more idiomatic environ.get
#-------------------------------------------------------------------------------
{# if  salt['environ.get']('ETCD_MACHINES') -#}
{% if  salt['cmd.run']('echo $ETCD_MACHINES') -%}
export ETCD_MACHINES="{{ salt['cmd.run']('echo $ETCD_MACHINES') }}"
{% else -%}
{% if  minions['etcd'] -%}
{% set machines = [] -%}
{% for minion in minions['etcd'] -%}
{% do  machines.append('http://' + minion + ':4001') -%}
{% endfor -%}
export ETCD_MACHINES="{{ machines|join(',') }}"
{% endif -%}
{% endif -%}
