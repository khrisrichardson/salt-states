# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_cinder-common:
  salt.state:
    - tgt:         roles:cinder-common
    - tgt_type:    grain
    - sls:         cinder-common
    - require:
      - salt:      state_sls_salt-minion

state_sls_cinder-common_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:cinder-common'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['cinder-common']}
    - require:
      - salt:      state_sls_cinder-common
