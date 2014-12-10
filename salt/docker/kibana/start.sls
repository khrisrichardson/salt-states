# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run
  -  docker.salt-master.start
  -  docker.elasticsearch.start
  -  docker.logstash.start

docker start {{ psls }}:
  docker.running:
    - container:     {{ psls }}
    - links:
        salt-master:    salt
    - lxc_conf:    []
    - port_bindings:
        '80/tcp':
            HostIp:    '0.0.0.0'
            HostPort:  '80'
    - watch:
      - docker:    docker run {{ psls }}
      - docker:    docker start salt-master
      - docker:    docker start elasticsearch
      - docker:    docker start logstash
