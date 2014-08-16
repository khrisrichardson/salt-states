# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_qpidd:
  salt.state:
    - tgt:         roles:qpidd
    - tgt_type:    grain
    - sls:         qpidd
    - require:
      - salt:      state_sls_salt-minion

state_sls_qpidd_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:qpidd'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['qpidd']}
    - require:
      - salt:      state_sls_qpidd
