# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_sudo:
  salt.state:
    - tgt:         roles:sudo
    - tgt_type:    grain
    - sls:         sudo
    - require:
      - salt:      state_sls_salt-minion

state_sls_sudo_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:sudo'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['sudo']}
    - require:
      - salt:      state_sls_sudo
