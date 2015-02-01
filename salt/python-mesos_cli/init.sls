# vi: set ft=yaml.jinja :

include:
  -  python-pip

python-mesos_cli:
  pip.installed:
    - name:        mesos.cli
    - require:
      - pkg:       python-pip
