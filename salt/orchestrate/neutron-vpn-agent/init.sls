# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_neutron-vpn-agent:
  salt.state:
    - tgt:         roles:neutron-vpn-agent
    - tgt_type:    grain
    - sls:         neutron-vpn-agent
    - require:
      - salt:      state_sls_salt-minion

state_sls_neutron-vpn-agent_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:neutron-vpn-agent'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['neutron-vpn-agent']}
    - require:
      - salt:      state_sls_neutron-vpn-agent
