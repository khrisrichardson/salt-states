# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ruby-bluepill:
  salt.state:
    - tgt:         roles:ruby-bluepill
    - tgt_type:    grain
    - sls:         ruby-bluepill
    - require:
      - salt:      state_sls_salt-minion

state_sls_ruby-bluepill_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ruby-bluepill'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ruby-bluepill']}
    - require:
      - salt:      state_sls_ruby-bluepill
