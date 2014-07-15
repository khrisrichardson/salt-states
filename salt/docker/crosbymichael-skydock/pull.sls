# vi: set ft=yaml.jinja :

include:
  -  python-docker

docker pull crosbymichael/skydock:
  docker.pulled:
    - name:        crosbymichael/skydock
