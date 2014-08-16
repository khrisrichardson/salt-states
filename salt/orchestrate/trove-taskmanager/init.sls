# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_trove-taskmanager:
  salt.state:
    - tgt:         roles:trove-taskmanager
    - tgt_type:    grain
    - sls:         trove-taskmanager
    - require:
      - salt:      state_sls_salt-minion

state_sls_trove-taskmanager_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:trove-taskmanager'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['trove-taskmanager']}
    - require:
      - salt:      state_sls_trove-taskmanager
