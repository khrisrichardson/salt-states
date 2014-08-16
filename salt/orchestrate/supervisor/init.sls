# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_supervisor:
  salt.state:
    - tgt:         roles:supervisor
    - tgt_type:    grain
    - sls:         supervisor
    - require:
      - salt:      state_sls_salt-minion

state_sls_supervisor_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:supervisor'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['supervisor']}
    - require:
      - salt:      state_sls_supervisor
