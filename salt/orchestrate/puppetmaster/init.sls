# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_puppetmaster:
  salt.state:
    - tgt:         roles:puppetmaster
    - tgt_type:    grain
    - sls:         puppetmaster
    - require:
      - salt:      state_sls_salt-minion

state_sls_puppetmaster_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:puppetmaster'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['puppetmaster']}
    - require:
      - salt:      state_sls_puppetmaster
