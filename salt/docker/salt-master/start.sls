# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run

docker start {{ psls }}:
  docker.running:
    - container:     {{ psls }}
    - binds:
        /var/cache/salt/master:
          bind:        /var/cache/salt/master
          ro:           false
    - links:       []
    - lxc_conf:    []
    - watch:
      - docker:    docker run {{ psls }}
