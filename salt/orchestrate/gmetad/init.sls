# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_gmetad:
  salt.state:
    - tgt:         roles:gmetad
    - tgt_type:    grain
    - sls:         gmetad
    - require:
      - salt:      state_sls_salt-minion

state_sls_gmetad_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:gmetad'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['gmetad']}
    - require:
      - salt:      state_sls_gmetad
