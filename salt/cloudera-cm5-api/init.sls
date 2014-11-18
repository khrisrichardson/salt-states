# vi: set ft=yaml.jinja :

{% from  'cloudera-cm5-api/map.jinja'
   import cloudera_cm5_api
   with   context %}

include:
  -  python-pip

cloudera-cm5-api:
  pip.installed:
    - name:     {{ cloudera_cm5_api['pip']['name'] }}
    - require:
      - pkg:       python-pip
