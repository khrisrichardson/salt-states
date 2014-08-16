# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-compute-lxc:
  salt.state:
    - tgt:         roles:nova-compute-lxc
    - tgt_type:    grain
    - sls:         nova-compute-lxc
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-compute-lxc_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-compute-lxc'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-compute-lxc']}
    - require:
      - salt:      state_sls_nova-compute-lxc
