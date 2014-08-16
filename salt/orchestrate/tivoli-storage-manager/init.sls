# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_tivoli-storage-manager:
  salt.state:
    - tgt:         roles:tivoli-storage-manager
    - tgt_type:    grain
    - sls:         tivoli-storage-manager
    - require:
      - salt:      state_sls_salt-minion

state_sls_tivoli-storage-manager_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:tivoli-storage-manager'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['tivoli-storage-manager']}
    - require:
      - salt:      state_sls_tivoli-storage-manager
