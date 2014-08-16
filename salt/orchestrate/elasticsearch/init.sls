# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_elasticsearch:
  salt.state:
    - tgt:         roles:elasticsearch
    - tgt_type:    grain
    - sls:         elasticsearch
    - require:
      - salt:      state_sls_salt-minion

state_sls_elasticsearch_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:elasticsearch'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['elasticsearch']}
    - require:
      - salt:      state_sls_elasticsearch
