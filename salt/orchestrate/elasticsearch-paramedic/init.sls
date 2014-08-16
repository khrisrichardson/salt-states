# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_elasticsearch-paramedic:
  salt.state:
    - tgt:         roles:elasticsearch-paramedic
    - tgt_type:    grain
    - sls:         elasticsearch-paramedic
    - require:
      - salt:      state_sls_salt-minion

state_sls_elasticsearch-paramedic_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:elasticsearch-paramedic'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['elasticsearch-paramedic']}
    - require:
      - salt:      state_sls_elasticsearch-paramedic
