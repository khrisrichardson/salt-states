# vi: set ft=yaml.jinja :

include:
  -  python-docker

docker pull coreos/etcd:
  docker.pulled:
    - name:        coreos/etcd
