# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_oozie:
  salt.state:
    - tgt:         roles:oozie
    - tgt_type:    grain
    - sls:         oozie
    - require:
      - salt:      state_sls_salt-minion

state_sls_oozie_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:oozie'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['oozie']}
    - require:
      - salt:      state_sls_oozie
