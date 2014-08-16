# vi: set ft=yaml.jinja :

include:
  -  python-pip

python-influxdb:
  pip.installed:
    - name:        influxdb
    - require:
      - pkg:       python-pip
