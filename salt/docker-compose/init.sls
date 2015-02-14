# vi: set ft=yaml.jinja :

include:
  -  python-pip

docker-compose:
  pip.installed:
    - require:
      - pkg:       python-pip
