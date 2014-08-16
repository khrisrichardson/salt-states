# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_fleet:
  salt.state:
    - tgt:         roles:fleet
    - tgt_type:    grain
    - sls:         fleet
    - require:
      - salt:      state_sls_salt-minion

state_sls_fleet_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:fleet'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['fleet']}
    - require:
      - salt:      state_sls_fleet
