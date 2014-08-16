# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_coreos:
  salt.state:
    - tgt:         roles:coreos
    - tgt_type:    grain
    - sls:         coreos
    - require:
      - salt:      state_sls_salt-minion

state_sls_coreos_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:coreos'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['coreos']}
    - require:
      - salt:      state_sls_coreos
