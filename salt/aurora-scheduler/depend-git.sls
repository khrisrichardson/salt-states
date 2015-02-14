# vi: set ft=yaml.jinja :

include:
  -  aurora.depend-git

extend:
  ./gradlew distZip:
    cmd.wait:
      - watch:
        - git:     http://git-wip-us.apache.org/repos/asf/incubator-aurora.git
