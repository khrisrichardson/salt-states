# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_dynaTrace-common:
  salt.state:
    - tgt:         roles:dynaTrace-common
    - tgt_type:    grain
    - sls:         dynaTrace-common
    - require:
      - salt:      state_sls_salt-minion

state_sls_dynaTrace-common_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:dynaTrace-common'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['dynaTrace-common']}
    - require:
      - salt:      state_sls_dynaTrace-common
