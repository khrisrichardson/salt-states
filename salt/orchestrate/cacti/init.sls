# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_cacti:
  salt.state:
    - tgt:         roles:cacti
    - tgt_type:    grain
    - sls:         cacti
    - require:
      - salt:      state_sls_salt-minion

state_sls_cacti_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:cacti'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['cacti']}
    - require:
      - salt:      state_sls_cacti
