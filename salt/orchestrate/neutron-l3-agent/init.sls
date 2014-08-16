# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_neutron-l3-agent:
  salt.state:
    - tgt:         roles:neutron-l3-agent
    - tgt_type:    grain
    - sls:         neutron-l3-agent
    - require:
      - salt:      state_sls_salt-minion

state_sls_neutron-l3-agent_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:neutron-l3-agent'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['neutron-l3-agent']}
    - require:
      - salt:      state_sls_neutron-l3-agent
