# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_salt-syndic:
  salt.state:
    - tgt:         roles:salt-syndic
    - tgt_type:    grain
    - sls:         salt-syndic
    - require:
      - salt:      state_sls_salt-minion

state_sls_salt-syndic_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:salt-syndic'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['salt-syndic']}
    - require:
      - salt:      state_sls_salt-syndic
