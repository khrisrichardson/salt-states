# vi: set ft=yaml.jinja :

{% set ipv4 = salt['config.get']('fqdn_ip4') %}
{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.pull

docker run coreos/etcd01:
  docker.installed:
    - name:        etcd01
    - image:       coreos/etcd
    - command:    -name etcd01 -addr {{ ipv4[0] }}:4001 -peer-addr {{ ipv4[0] }}:7001
    - watch:
      - docker:    docker pull coreos/etcd

docker run coreos/etcd02:
  docker.installed:
    - name:        etcd02
    - image:       coreos/etcd
    - command:    -name etcd02 -addr {{ ipv4[0] }}:4001 -peer-addr {{ ipv4[0] }}:7001 -peers 172.17.42.1:7001,172.17.42.1:7002,172.17.42.1:7003
    - watch:
      - docker:    docker pull coreos/etcd

docker run coreos/etcd03:
  docker.installed:
    - name:        etcd03
    - image:       coreos/etcd
    - command:    -name etcd03 -addr {{ ipv4[0] }}:4001 -peer-addr {{ ipv4[0] }}:7001 -peers 172.17.42.1:7001,172.17.42.1:7002,172.17.42.1:7003
    - watch:
      - docker:    docker pull coreos/etcd
