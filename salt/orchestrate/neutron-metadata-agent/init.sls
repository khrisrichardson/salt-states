# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_neutron-metadata-agent:
  salt.state:
    - tgt:         roles:neutron-metadata-agent
    - tgt_type:    grain
    - sls:         neutron-metadata-agent
    - require:
      - salt:      state_sls_salt-minion

state_sls_neutron-metadata-agent_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:neutron-metadata-agent'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['neutron-metadata-agent']}
    - require:
      - salt:      state_sls_neutron-metadata-agent
