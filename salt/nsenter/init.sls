# vi: set ft=yaml.jinja :

include:
  -  debianutils
  -  lxc-docker
  -  sudo

docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter:
  cmd.run:
    - unless:      test -f /usr/local/bin/nsenter
    - require:
      - pkg:       lxc-docker

/usr/local/bin/docker-enter:
  file.managed:
    - source:      salt://{{ sls }}/usr/local/bin/docker-enter
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - pkg:       debianutils
      - pkg:       sudo
      - cmd:       docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter
