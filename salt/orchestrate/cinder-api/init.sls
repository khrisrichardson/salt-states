# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_cinder-api:
  salt.state:
    - tgt:         roles:cinder-api
    - tgt_type:    grain
    - sls:         cinder-api
    - require:
      - salt:      state_sls_salt-minion

state_sls_cinder-api_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:cinder-api'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['cinder-api']}
    - require:
      - salt:      state_sls_cinder-api
