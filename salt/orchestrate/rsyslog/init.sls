# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_rsyslog:
  salt.state:
    - tgt:         roles:rsyslog
    - tgt_type:    grain
    - sls:         rsyslog
    - require:
      - salt:      state_sls_salt-minion

state_sls_rsyslog_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:rsyslog'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['rsyslog']}
    - require:
      - salt:      state_sls_rsyslog
