# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_newrelic-daemon:
  salt.state:
    - tgt:         roles:newrelic-daemon
    - tgt_type:    grain
    - sls:         newrelic-daemon
    - require:
      - salt:      state_sls_salt-minion

state_sls_newrelic-daemon_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:newrelic-daemon'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['newrelic-daemon']}
    - require:
      - salt:      state_sls_newrelic-daemon
