# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nginx-common:
  salt.state:
    - tgt:         roles:nginx-common
    - tgt_type:    grain
    - sls:         nginx-common
    - require:
      - salt:      state_sls_salt-minion

state_sls_nginx-common_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nginx-common'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nginx-common']}
    - require:
      - salt:      state_sls_nginx-common
