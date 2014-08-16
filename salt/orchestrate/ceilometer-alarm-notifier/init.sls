# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceilometer-alarm-notifier:
  salt.state:
    - tgt:         roles:ceilometer-alarm-notifier
    - tgt_type:    grain
    - sls:         ceilometer-alarm-notifier
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceilometer-alarm-notifier_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceilometer-alarm-notifier'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceilometer-alarm-notifier']}
    - require:
      - salt:      state_sls_ceilometer-alarm-notifier
