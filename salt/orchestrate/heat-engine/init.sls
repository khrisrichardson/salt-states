# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_heat-engine:
  salt.state:
    - tgt:         roles:heat-engine
    - tgt_type:    grain
    - sls:         heat-engine
    - require:
      - salt:      state_sls_salt-minion

state_sls_heat-engine_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:heat-engine'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['heat-engine']}
    - require:
      - salt:      state_sls_heat-engine
