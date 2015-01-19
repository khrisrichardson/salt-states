# vi: set ft=yaml.jinja :

include:
  -  docker-registry
  -  git

extend:
  /opt/docker/registry/config.yml:
    file.managed:
      - require:
        - git:     https://github.com/docker/docker-registry.git

https://github.com/docker/docker-registry.git:
  git.latest:
    - rev:         master
    - force:       True
    - target:     /opt/docker/registry
    - require:
      - pkg:       git
