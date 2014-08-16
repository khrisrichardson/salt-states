# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-compute-kvm:
  salt.state:
    - tgt:         roles:nova-compute-kvm
    - tgt_type:    grain
    - sls:         nova-compute-kvm
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-compute-kvm_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-compute-kvm'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-compute-kvm']}
    - require:
      - salt:      state_sls_nova-compute-kvm
