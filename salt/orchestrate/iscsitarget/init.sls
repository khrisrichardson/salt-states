# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_iscsitarget:
  salt.state:
    - tgt:         roles:iscsitarget
    - tgt_type:    grain
    - sls:         iscsitarget
    - require:
      - salt:      state_sls_salt-minion

state_sls_iscsitarget_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:iscsitarget'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['iscsitarget']}
    - require:
      - salt:      state_sls_iscsitarget
