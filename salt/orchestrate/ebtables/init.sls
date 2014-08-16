# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ebtables:
  salt.state:
    - tgt:         roles:ebtables
    - tgt_type:    grain
    - sls:         ebtables
    - require:
      - salt:      state_sls_salt-minion

state_sls_ebtables_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ebtables'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ebtables']}
    - require:
      - salt:      state_sls_ebtables
