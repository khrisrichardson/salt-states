# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_snmpd:
  salt.state:
    - tgt:         roles:snmpd
    - tgt_type:    grain
    - sls:         snmpd
    - require:
      - salt:      state_sls_salt-minion

state_sls_snmpd_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:snmpd'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['snmpd']}
    - require:
      - salt:      state_sls_snmpd
