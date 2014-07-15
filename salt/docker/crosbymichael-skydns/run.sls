# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.pull

docker run crosbymichael/skydns:
  docker.installed:
    - name:        skydns
    - image:       crosbymichael/skydns
    - command:    -nameserver="8.8.8.8:53,8.8.4.4:53"
    - watch:
      - docker:    docker pull crosbymichael/skydns
