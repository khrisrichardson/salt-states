# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_heat-common:
  salt.state:
    - tgt:         roles:heat-common
    - tgt_type:    grain
    - sls:         heat-common
    - require:
      - salt:      state_sls_salt-minion

state_sls_heat-common_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:heat-common'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['heat-common']}
    - require:
      - salt:      state_sls_heat-common
