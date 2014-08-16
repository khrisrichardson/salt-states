# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_neutron-plugin-mlnx-agent:
  salt.state:
    - tgt:         roles:neutron-plugin-mlnx-agent
    - tgt_type:    grain
    - sls:         neutron-plugin-mlnx-agent
    - require:
      - salt:      state_sls_salt-minion

state_sls_neutron-plugin-mlnx-agent_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:neutron-plugin-mlnx-agent'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['neutron-plugin-mlnx-agent']}
    - require:
      - salt:      state_sls_neutron-plugin-mlnx-agent
