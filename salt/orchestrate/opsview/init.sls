# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_opsview:
  salt.state:
    - tgt:         roles:opsview
    - tgt_type:    grain
    - sls:         opsview
    - require:
      - salt:      state_sls_salt-minion

state_sls_opsview_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:opsview'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['opsview']}
    - require:
      - salt:      state_sls_opsview
