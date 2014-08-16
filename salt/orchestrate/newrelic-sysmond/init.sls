# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_newrelic-sysmond:
  salt.state:
    - tgt:         roles:newrelic-sysmond
    - tgt_type:    grain
    - sls:         newrelic-sysmond
    - require:
      - salt:      state_sls_salt-minion

state_sls_newrelic-sysmond_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:newrelic-sysmond'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['newrelic-sysmond']}
    - require:
      - salt:      state_sls_newrelic-sysmond
