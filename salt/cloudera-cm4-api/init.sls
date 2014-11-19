# vi: set ft=yaml.jinja :

{% from 'cloudera-cm4-api/map.jinja' import map with context %}

include:
  -  python-pip

cloudera-cm4-api:
  pip.installed:
    - name:     {{ map.get('pip', {}).get('name') }}
    - require:
      - pkg:       python-pip
