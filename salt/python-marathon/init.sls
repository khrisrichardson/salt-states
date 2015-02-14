# vi: set ft=yaml.jinja :

include:
  -  python-pip

python-marathon:
  pip.installed:
    - name:        marathon
    - require:
      - pkg:       python-pip
