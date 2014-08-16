# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_puppet:
  salt.state:
    - tgt:         roles:puppet
    - tgt_type:    grain
    - sls:         puppet
    - require:
      - salt:      state_sls_salt-minion

state_sls_puppet_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:puppet'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['puppet']}
    - require:
      - salt:      state_sls_puppet
