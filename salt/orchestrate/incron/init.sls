# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_incron:
  salt.state:
    - tgt:         roles:incron
    - tgt_type:    grain
    - sls:         incron
    - require:
      - salt:      state_sls_salt-minion

state_sls_incron_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:incron'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['incron']}
    - require:
      - salt:      state_sls_incron
