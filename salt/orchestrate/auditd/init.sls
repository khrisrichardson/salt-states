# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_auditd:
  salt.state:
    - tgt:         roles:auditd
    - tgt_type:    grain
    - sls:         auditd
    - require:
      - salt:      state_sls_salt-minion

state_sls_auditd_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:auditd'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['auditd']}
    - require:
      - salt:      state_sls_auditd
