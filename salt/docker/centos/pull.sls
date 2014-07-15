# vi: set ft=yaml.jinja :

include:
  -  python-docker

docker pull centos:
  docker.pulled:
    - name:        centos
