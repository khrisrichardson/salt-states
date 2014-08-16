# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_postfix:
  salt.state:
    - tgt:         roles:postfix
    - tgt_type:    grain
    - sls:         postfix
    - require:
      - salt:      state_sls_salt-minion

state_sls_postfix_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:postfix'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['postfix']}
    - require:
      - salt:      state_sls_postfix
