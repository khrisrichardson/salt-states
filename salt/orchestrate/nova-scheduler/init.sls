# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-scheduler:
  salt.state:
    - tgt:         roles:nova-scheduler
    - tgt_type:    grain
    - sls:         nova-scheduler
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-scheduler_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-scheduler'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-scheduler']}
    - require:
      - salt:      state_sls_nova-scheduler
