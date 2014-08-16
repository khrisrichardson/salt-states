# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_qemu-kvm:
  salt.state:
    - tgt:         roles:qemu-kvm
    - tgt_type:    grain
    - sls:         qemu-kvm
    - require:
      - salt:      state_sls_salt-minion

state_sls_qemu-kvm_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:qemu-kvm'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['qemu-kvm']}
    - require:
      - salt:      state_sls_qemu-kvm
