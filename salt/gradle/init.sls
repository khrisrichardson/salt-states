# vi: set ft=yaml.jinja :

gradle:
  pkg.installed:
    - watch_in:
      - file:     /usr/bin/gradle

/usr/bin/gradle:
  file.replace:
    - pattern:   '^export JAVA_HOME'
    - repl:      '#export JAVA_HOME'
