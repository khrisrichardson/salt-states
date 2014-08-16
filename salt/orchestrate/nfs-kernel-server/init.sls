# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nfs-kernel-server:
  salt.state:
    - tgt:         roles:nfs-kernel-server
    - tgt_type:    grain
    - sls:         nfs-kernel-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_nfs-kernel-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nfs-kernel-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nfs-kernel-server']}
    - require:
      - salt:      state_sls_nfs-kernel-server
