# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_heat-api-cfn:
  salt.state:
    - tgt:         roles:heat-api-cfn
    - tgt_type:    grain
    - sls:         heat-api-cfn
    - require:
      - salt:      state_sls_salt-minion

state_sls_heat-api-cfn_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:heat-api-cfn'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['heat-api-cfn']}
    - require:
      - salt:      state_sls_heat-api-cfn
