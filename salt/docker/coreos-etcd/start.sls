# vi: set ft=yaml.jinja :

{% set ipv4 = salt['config.get']('fqdn_ip4') %}
{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run

docker start etcd01:
  docker.running:
    - container:   etcd01
    - lxc_conf:    []
    - port_bindings:
        '4001/tcp':
            HostIp:    '172.17.42.1'
            HostPort:  '4001'
        '7001/tcp':
            HostIp:    '172.17.42.1'
            HostPort:  '7001'
    - watch:
      - docker:    docker run coreos/etcd01

docker start etcd02:
  docker.running:
    - container:   etcd02
    - lxc_conf:    []
    - port_bindings:
        '4001/tcp':
            HostIp:    '172.17.42.1'
            HostPort:  '4002'
        '7001/tcp':
            HostIp:    '172.17.42.1'
            HostPort:  '7002'
    - watch:
      - docker:    docker run coreos/etcd02
      - docker:    docker start etcd01

docker start etcd03:
  docker.running:
    - container:   etcd03
    - lxc_conf:    []
    - port_bindings:
        '4001/tcp':
            HostIp:    '172.17.42.1'
            HostPort:  '4003'
        '7001/tcp':
            HostIp:    '172.17.42.1'
            HostPort:  '7003'
    - watch:
      - docker:    docker run coreos/etcd03
      - docker:    docker start etcd01
