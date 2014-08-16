# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_open-iscsi:
  salt.state:
    - tgt:         roles:open-iscsi
    - tgt_type:    grain
    - sls:         open-iscsi
    - require:
      - salt:      state_sls_salt-minion

state_sls_open-iscsi_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:open-iscsi'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['open-iscsi']}
    - require:
      - salt:      state_sls_open-iscsi
