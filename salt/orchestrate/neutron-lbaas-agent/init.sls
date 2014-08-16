# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_neutron-lbaas-agent:
  salt.state:
    - tgt:         roles:neutron-lbaas-agent
    - tgt_type:    grain
    - sls:         neutron-lbaas-agent
    - require:
      - salt:      state_sls_salt-minion

state_sls_neutron-lbaas-agent_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:neutron-lbaas-agent'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['neutron-lbaas-agent']}
    - require:
      - salt:      state_sls_neutron-lbaas-agent
