# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-common:
  salt.state:
    - tgt:         roles:nova-common
    - tgt_type:    grain
    - sls:         nova-common
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-common_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-common'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-common']}
    - require:
      - salt:      state_sls_nova-common
