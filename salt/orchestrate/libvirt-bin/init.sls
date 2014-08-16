# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_libvirt-bin:
  salt.state:
    - tgt:         roles:libvirt-bin
    - tgt_type:    grain
    - sls:         libvirt-bin
    - require:
      - salt:      state_sls_salt-minion

state_sls_libvirt-bin_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:libvirt-bin'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['libvirt-bin']}
    - require:
      - salt:      state_sls_libvirt-bin
