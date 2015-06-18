# vi: set ft=yaml.jinja :

include:
  -  python-pip

python-kubernetes:
  pip.installed:
    - require:
      - pkg:       python-pip
