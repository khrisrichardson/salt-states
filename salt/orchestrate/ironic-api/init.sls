# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ironic-api:
  salt.state:
    - tgt:         roles:ironic-api
    - tgt_type:    grain
    - sls:         ironic-api
    - require:
      - salt:      state_sls_salt-minion

state_sls_ironic-api_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ironic-api'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ironic-api']}
    - require:
      - salt:      state_sls_ironic-api
