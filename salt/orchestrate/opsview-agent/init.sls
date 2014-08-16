# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_opsview-agent:
  salt.state:
    - tgt:         roles:opsview-agent
    - tgt_type:    grain
    - sls:         opsview-agent
    - require:
      - salt:      state_sls_salt-minion

state_sls_opsview-agent_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:opsview-agent'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['opsview-agent']}
    - require:
      - salt:      state_sls_opsview-agent
