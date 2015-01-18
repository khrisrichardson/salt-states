# vi: set ft=yaml.jinja :

include:
  - .depend-git
  -  postfix

/opt/docker/registry/config.yml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/opt/docker/registry/config.yml
    - user:        root
    - group:       root
    - mode:       '0644'
