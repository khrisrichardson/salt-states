# vi: set ft=yaml.jinja :

include:
  -  python-docker

docker pull ubuntu:
  docker.pulled:
    - name:        ubuntu
