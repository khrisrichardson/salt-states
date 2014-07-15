# vi: set ft=yaml.jinja :

include:
  -  python-docker

docker pull registry:
  docker.pulled:
    - name:        registry
