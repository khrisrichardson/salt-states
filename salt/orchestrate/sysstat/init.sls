# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_sysstat:
  salt.state:
    - tgt:         roles:sysstat
    - tgt_type:    grain
    - sls:         sysstat
    - require:
      - salt:      state_sls_salt-minion

state_sls_sysstat_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:sysstat'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['sysstat']}
    - require:
      - salt:      state_sls_sysstat
