# vi: set ft=yaml.jinja :

include:
  -  maven

mvn:
  cmd.run:
    - name:     . /etc/profile && mvn
    - cwd:        /root
    - require:
      - file:     /root/pom.xml
      - file:     /usr/bin/mvn
