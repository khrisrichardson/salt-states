# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_neutron-metering-agent:
  salt.state:
    - tgt:         roles:neutron-metering-agent
    - tgt_type:    grain
    - sls:         neutron-metering-agent
    - require:
      - salt:      state_sls_salt-minion

state_sls_neutron-metering-agent_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:neutron-metering-agent'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['neutron-metering-agent']}
    - require:
      - salt:      state_sls_neutron-metering-agent
