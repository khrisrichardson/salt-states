# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceilometer-agent-notification:
  salt.state:
    - tgt:         roles:ceilometer-agent-notification
    - tgt_type:    grain
    - sls:         ceilometer-agent-notification
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceilometer-agent-notification_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceilometer-agent-notification'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceilometer-agent-notification']}
    - require:
      - salt:      state_sls_ceilometer-agent-notification
