# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_cloudera-cm4-daemons:
  salt.state:
    - tgt:         roles:cloudera-cm4-daemons
    - tgt_type:    grain
    - sls:         cloudera-cm4-daemons
    - require:
      - salt:      state_sls_salt-minion

state_sls_cloudera-cm4-daemons_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:cloudera-cm4-daemons'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['cloudera-cm4-daemons']}
    - require:
      - salt:      state_sls_cloudera-cm4-daemons
