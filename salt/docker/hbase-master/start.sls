# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run
  -  docker.salt-master.start
# -  docker.skydns2.start

docker start {{ psls }}:
  docker.running:
    - container:     {{ psls }}
    - links:
        salt-master:    salt
    - lxc_conf:    []
    - watch:
      - docker:    docker run {{ psls }}
      - docker:    docker start salt-master
#     - docker:    docker start skydns2
