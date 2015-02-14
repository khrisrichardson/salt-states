# vi: set ft=yaml.jinja :

include:
  -  aurora.depend-git

extend:
  ./pants binary src/main/python/apache/aurora/client/cli:aurora:
    cmd.wait:
      - watch:
        - git:     http://git-wip-us.apache.org/repos/asf/incubator-aurora.git
