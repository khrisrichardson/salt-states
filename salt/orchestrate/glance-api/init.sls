# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_glance-api:
  salt.state:
    - tgt:         roles:glance-api
    - tgt_type:    grain
    - sls:         glance-api
    - require:
      - salt:      state_sls_salt-minion

state_sls_glance-api_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:glance-api'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['glance-api']}
    - require:
      - salt:      state_sls_glance-api
