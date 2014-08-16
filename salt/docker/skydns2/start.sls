# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run
  -  docker.salt-master.start
  -  docker.etcd.start

docker start {{ psls }}:
  docker.running:
    - container:     {{ psls }}
    - links:
        salt-master:    salt
    - lxc_conf:    []
    - port_bindings:
        '53/tcp':
            HostIp:    '172.17.42.1'
            HostPort:  '53'
        '53/udp':
            HostIp:    '172.17.42.1'
            HostPort:  '53'
    - watch:
      - docker:    docker run {{ psls }}
      - docker:    docker start salt-master
      - docker:    docker start etcd
