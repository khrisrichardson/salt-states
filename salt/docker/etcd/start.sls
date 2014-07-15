# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run
  -  docker.salt-master.start

docker start {{ psls }}:
  docker.running:
    - container:     {{ psls }}
    - links:
        salt-master:    salt
    - lxc_conf:    []
    - port_bindings:
        '4001/tcp':
            HostIp:    '172.17.42.1'
            HostPort:  '4001'
        '7001/tcp':
            HostIp:    '172.17.42.1'
            HostPort:  '7001'
    - watch:
      - docker:    docker run {{ psls }}
      - docker:    docker start salt-master
