# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run
  -  docker.crosbymichael-skydns.start

docker start skydock:
  docker.running:
    - container:   skydock
    - binds:
        /var/run/docker.sock:
          bind:   /var/run/docker.sock
          ro:      false
    - links:
        skydns:    skydns
    - lxc_conf:    []
    - watch:
      - docker:    docker run crosbymichael/skydock
      - docker:    docker start skydns
