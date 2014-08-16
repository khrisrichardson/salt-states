# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-api:
  salt.state:
    - tgt:         roles:nova-api
    - tgt_type:    grain
    - sls:         nova-api
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-api_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-api'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-api']}
    - require:
      - salt:      state_sls_nova-api
