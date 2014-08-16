# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_corosync:
  salt.state:
    - tgt:         roles:corosync
    - tgt_type:    grain
    - sls:         corosync
    - require:
      - salt:      state_sls_salt-minion

state_sls_corosync_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:corosync'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['corosync']}
    - require:
      - salt:      state_sls_corosync
