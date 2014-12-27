# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.pull

docker run crosbymichael/dockerui:
  docker.installed:
    - name:        dockerui
    - image:       crosbymichael/dockerui
   {% if salt['ps.pgrep']('docker') %}
    - volumes:
      - /var/run/docker.sock
   {% endif %}
    - watch:
      - docker:    docker pull crosbymichael/dockerui
