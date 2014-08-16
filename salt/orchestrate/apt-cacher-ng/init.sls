# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_apt-cacher-ng:
  salt.state:
    - tgt:         roles:apt-cacher-ng
    - tgt_type:    grain
    - sls:         apt-cacher-ng
    - require:
      - salt:      state_sls_salt-minion

state_sls_apt-cacher-ng_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:apt-cacher-ng'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['apt-cacher-ng']}
    - require:
      - salt:      state_sls_apt-cacher-ng
