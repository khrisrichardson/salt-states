# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_jenkins:
  salt.state:
    - tgt:         roles:jenkins
    - tgt_type:    grain
    - sls:         jenkins
    - require:
      - salt:      state_sls_salt-minion

state_sls_jenkins_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:jenkins'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['jenkins']}
    - require:
      - salt:      state_sls_jenkins
