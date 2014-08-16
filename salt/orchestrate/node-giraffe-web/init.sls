# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_node-giraffe-web:
  salt.state:
    - tgt:         roles:node-giraffe-web
    - tgt_type:    grain
    - sls:         node-giraffe-web
    - require:
      - salt:      state_sls_salt-minion

state_sls_node-giraffe-web_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:node-giraffe-web'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['node-giraffe-web']}
    - require:
      - salt:      state_sls_node-giraffe-web
