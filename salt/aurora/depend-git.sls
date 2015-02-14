# vi: set ft=yaml.jinja :

include:
  -  git

http://git-wip-us.apache.org/repos/asf/incubator-aurora.git:
  git.latest:
    - rev:         master
    - user:        root
    - target:     /usr/local/src/git-wip-us.apache.org/repos/asf/incubator-aurora
    - require:
      - pkg:       git
