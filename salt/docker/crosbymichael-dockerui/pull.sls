# vi: set ft=yaml.jinja :

include:
  -  python-docker

docker pull crosbymichael/dockerui:
  docker.pulled:
    - name:        crosbymichael/dockerui
