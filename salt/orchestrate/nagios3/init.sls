# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nagios3:
  salt.state:
    - tgt:         roles:nagios3
    - tgt_type:    grain
    - sls:         nagios3
    - require:
      - salt:      state_sls_salt-minion

state_sls_nagios3_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nagios3'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nagios3']}
    - require:
      - salt:      state_sls_nagios3
