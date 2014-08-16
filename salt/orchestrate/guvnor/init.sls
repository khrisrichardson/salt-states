# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_guvnor:
  salt.state:
    - tgt:         roles:guvnor
    - tgt_type:    grain
    - sls:         guvnor
    - require:
      - salt:      state_sls_salt-minion

state_sls_guvnor_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:guvnor'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['guvnor']}
    - require:
      - salt:      state_sls_guvnor
