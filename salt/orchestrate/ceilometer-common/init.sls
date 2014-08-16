# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceilometer-common:
  salt.state:
    - tgt:         roles:ceilometer-common
    - tgt_type:    grain
    - sls:         ceilometer-common
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceilometer-common_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceilometer-common'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceilometer-common']}
    - require:
      - salt:      state_sls_ceilometer-common
