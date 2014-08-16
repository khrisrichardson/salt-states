# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_openssh-server:
  salt.state:
    - tgt:         roles:openssh-server
    - tgt_type:    grain
    - sls:         openssh-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_openssh-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:openssh-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['openssh-server']}
    - require:
      - salt:      state_sls_openssh-server
