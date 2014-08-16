# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_tasseo:
  salt.state:
    - tgt:         roles:tasseo
    - tgt_type:    grain
    - sls:         tasseo
    - require:
      - salt:      state_sls_salt-minion

state_sls_tasseo_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:tasseo'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['tasseo']}
    - require:
      - salt:      state_sls_tasseo
