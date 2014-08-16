# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_beaver:
  salt.state:
    - tgt:         roles:beaver
    - tgt_type:    grain
    - sls:         beaver
    - require:
      - salt:      state_sls_salt-minion

state_sls_beaver_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:beaver'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['beaver']}
    - require:
      - salt:      state_sls_beaver
