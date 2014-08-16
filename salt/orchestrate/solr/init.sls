# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_solr:
  salt.state:
    - tgt:         roles:solr
    - tgt_type:    grain
    - sls:         solr
    - require:
      - salt:      state_sls_salt-minion

state_sls_solr_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:solr'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['solr']}
    - require:
      - salt:      state_sls_solr
