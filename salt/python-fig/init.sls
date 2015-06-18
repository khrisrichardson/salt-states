# vi: set ft=yaml.jinja :

include:
  -  python-pip

python-fig:
  pip.installed:
    - name:        fig
    - require:
      - pkg:       python-pip
