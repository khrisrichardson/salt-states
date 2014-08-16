# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ntpdate:
  salt.state:
    - tgt:         roles:ntpdate
    - tgt_type:    grain
    - sls:         ntpdate
    - require:
      - salt:      state_sls_salt-minion

state_sls_ntpdate_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ntpdate'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ntpdate']}
    - require:
      - salt:      state_sls_ntpdate
