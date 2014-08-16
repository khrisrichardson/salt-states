# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_tgt:
  salt.state:
    - tgt:         roles:tgt
    - tgt_type:    grain
    - sls:         tgt
    - require:
      - salt:      state_sls_salt-minion

state_sls_tgt_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:tgt'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['tgt']}
    - require:
      - salt:      state_sls_tgt
