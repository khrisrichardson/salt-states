# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_cron:
  salt.state:
    - tgt:         roles:cron
    - tgt_type:    grain
    - sls:         cron
    - require:
      - salt:      state_sls_salt-minion

state_sls_cron_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:cron'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['cron']}
    - require:
      - salt:      state_sls_cron
