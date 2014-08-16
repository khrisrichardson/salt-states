# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_trove-api:
  salt.state:
    - tgt:         roles:trove-api
    - tgt_type:    grain
    - sls:         trove-api
    - require:
      - salt:      state_sls_salt-minion

state_sls_trove-api_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:trove-api'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['trove-api']}
    - require:
      - salt:      state_sls_trove-api
