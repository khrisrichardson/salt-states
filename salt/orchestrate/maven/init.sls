# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_maven:
  salt.state:
    - tgt:         roles:maven
    - tgt_type:    grain
    - sls:         maven
    - require:
      - salt:      state_sls_salt-minion

state_sls_maven_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:maven'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['maven']}
    - require:
      - salt:      state_sls_maven
