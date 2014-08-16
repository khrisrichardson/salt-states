# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_heat-api-cloudwatch:
  salt.state:
    - tgt:         roles:heat-api-cloudwatch
    - tgt_type:    grain
    - sls:         heat-api-cloudwatch
    - require:
      - salt:      state_sls_salt-minion

state_sls_heat-api-cloudwatch_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:heat-api-cloudwatch'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['heat-api-cloudwatch']}
    - require:
      - salt:      state_sls_heat-api-cloudwatch
