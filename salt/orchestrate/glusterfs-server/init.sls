# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_glusterfs-server:
  salt.state:
    - tgt:         roles:glusterfs-server
    - tgt_type:    grain
    - sls:         glusterfs-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_glusterfs-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:glusterfs-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['glusterfs-server']}
    - require:
      - salt:      state_sls_glusterfs-server
