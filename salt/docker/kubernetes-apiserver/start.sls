# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run
  -  docker.salt-master.start
  -  docker.etcd.start
  -  docker.kubernetes-kubelet.start

docker start {{ psls }}:
  docker.running:
    - container:     {{ psls }}
    - links:
        salt-master:    salt
    - lxc_conf:    []
    - watch:
      - docker:    docker run {{ psls }}
      - docker:    docker start salt-master
      - docker:    docker start etcd
      - docker:    docker start kubernetes-kubelet
