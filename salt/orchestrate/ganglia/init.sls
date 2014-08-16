# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ganglia:
  salt.state:
    - tgt:         roles:ganglia
    - tgt_type:    grain
    - sls:         ganglia
    - require:
      - salt:      state_sls_salt-minion

state_sls_ganglia_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ganglia'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ganglia']}
    - require:
      - salt:      state_sls_ganglia
