# vi: set ft=yaml.jinja :

include:
  - .depend-git
  -  lxc-docker

./script/build:
  cmd.wait:
    - require:
      - pkg:       lxc-docker
