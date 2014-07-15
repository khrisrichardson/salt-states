# vi: set ft=yaml.jinja :

include:
  -  python-docker

docker pull debian:
  docker.pulled:
    - name:        debian
