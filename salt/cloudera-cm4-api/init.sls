# vi: set ft=yaml.jinja :

{% from  'cloudera-cm4-api/map.jinja'
   import cloudera_cm4_api
   with   context %}

include:
  -  python-pip

cloudera-cm4-api:
  pip.installed:
    - name:     {{ cloudera_cm4_api['pip']['name'] }}
    - require:
      - pkg:       python-pip
