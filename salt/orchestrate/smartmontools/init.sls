# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_smartmontools:
  salt.state:
    - tgt:         roles:smartmontools
    - tgt_type:    grain
    - sls:         smartmontools
    - require:
      - salt:      state_sls_salt-minion

state_sls_smartmontools_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:smartmontools'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['smartmontools']}
    - require:
      - salt:      state_sls_smartmontools
