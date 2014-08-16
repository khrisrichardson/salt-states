# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_neutron-dhcp-agent:
  salt.state:
    - tgt:         roles:neutron-dhcp-agent
    - tgt_type:    grain
    - sls:         neutron-dhcp-agent
    - require:
      - salt:      state_sls_salt-minion

state_sls_neutron-dhcp-agent_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:neutron-dhcp-agent'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['neutron-dhcp-agent']}
    - require:
      - salt:      state_sls_neutron-dhcp-agent
