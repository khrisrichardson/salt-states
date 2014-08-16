# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_neutron-server:
  salt.state:
    - tgt:         roles:neutron-server
    - tgt_type:    grain
    - sls:         neutron-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_neutron-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:neutron-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['neutron-server']}
    - require:
      - salt:      state_sls_neutron-server
