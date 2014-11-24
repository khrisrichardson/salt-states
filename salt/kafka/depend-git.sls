# vi: set ft=yaml.jinja :

include:
  -  git
  -  kafka

https://git-wip-us.apache.org/repos/asf/kafka.git:
  git.latest:
    - rev:         master
    - user:        root
    - target:     /usr/local/src/git-wip-us.apache.org/repos/asf/kafka
    - require:
      - pkg:       git
