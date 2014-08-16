# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_racoon:
  salt.state:
    - tgt:         roles:racoon
    - tgt_type:    grain
    - sls:         racoon
    - require:
      - salt:      state_sls_salt-minion

state_sls_racoon_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:racoon'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['racoon']}
    - require:
      - salt:      state_sls_racoon
