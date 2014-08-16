# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_multipath-tools:
  salt.state:
    - tgt:         roles:multipath-tools
    - tgt_type:    grain
    - sls:         multipath-tools
    - require:
      - salt:      state_sls_salt-minion

state_sls_multipath-tools_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:multipath-tools'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['multipath-tools']}
    - require:
      - salt:      state_sls_multipath-tools
