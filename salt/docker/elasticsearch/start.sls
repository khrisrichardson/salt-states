# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run
  -  docker.salt-master.start

docker start {{ psls }}:
  docker.running:
    - container:     {{ psls }}
    - binds:
        /var/cache/{{ psls }}:
          bind:        /var/cache/{{ psls }}
          ro:           false
    - links:
        salt-master:    salt
    - lxc_conf:    []
    - watch:
      - docker:    docker run {{ psls }}
      - docker:    docker start salt-master
