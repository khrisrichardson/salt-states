# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_cobbler:
  salt.state:
    - tgt:         roles:cobbler
    - tgt_type:    grain
    - sls:         cobbler
    - require:
      - salt:      state_sls_salt-minion

state_sls_cobbler_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:cobbler'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['cobbler']}
    - require:
      - salt:      state_sls_cobbler
