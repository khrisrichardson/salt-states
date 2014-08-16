# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-compute-qemu:
  salt.state:
    - tgt:         roles:nova-compute-qemu
    - tgt_type:    grain
    - sls:         nova-compute-qemu
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-compute-qemu_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-compute-qemu'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-compute-qemu']}
    - require:
      - salt:      state_sls_nova-compute-qemu
