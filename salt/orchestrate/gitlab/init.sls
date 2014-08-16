# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_gitlab:
  salt.state:
    - tgt:         roles:gitlab
    - tgt_type:    grain
    - sls:         gitlab
    - require:
      - salt:      state_sls_salt-minion

state_sls_gitlab_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:gitlab'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['gitlab']}
    - require:
      - salt:      state_sls_gitlab
