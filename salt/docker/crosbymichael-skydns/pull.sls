# vi: set ft=yaml.jinja :

include:
  -  python-docker

docker pull crosbymichael/skydns:
  docker.pulled:
    - name:        crosbymichael/skydns
