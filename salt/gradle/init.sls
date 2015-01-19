# vi: set ft=yaml.jinja :

gradle:
  pkg.installed:   []

/usr/bin/gradle:
  file.replace:
    - pattern:   '^export JAVA_HOME'
    - repl:      '#export JAVA_HOME'
    - watch:
      - pkg:       gradle
