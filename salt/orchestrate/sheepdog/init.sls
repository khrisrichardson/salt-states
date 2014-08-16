# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_sheepdog:
  salt.state:
    - tgt:         roles:sheepdog
    - tgt_type:    grain
    - sls:         sheepdog
    - require:
      - salt:      state_sls_salt-minion

state_sls_sheepdog_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:sheepdog'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['sheepdog']}
    - require:
      - salt:      state_sls_sheepdog
