# vi: set ft=yaml.jinja :

include:
  -  python-pip

python-consulate:
  pip.installed:
    - name:        consulate
    - require:
      - pkg:       python-pip
