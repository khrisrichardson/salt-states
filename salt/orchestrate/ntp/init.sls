# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ntp:
  salt.state:
    - tgt:         roles:ntp
    - tgt_type:    grain
    - sls:         ntp
    - require:
      - salt:      state_sls_salt-minion

state_sls_ntp_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ntp'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ntp']}
    - require:
      - salt:      state_sls_ntp
