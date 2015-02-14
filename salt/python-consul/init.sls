# vi: set ft=yaml.jinja :

include:
  -  python-pip

python-consul:
  pip.installed:
    - require:
      - pkg:       python-pip
