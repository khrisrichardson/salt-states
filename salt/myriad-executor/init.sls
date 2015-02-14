# vi: set ft=yaml.jinja :

include:
  -  gradle
  -  mesos-slave
  -  myriad

/usr/local/libexec/mesos/myriad-executor-x.x.x.jar:
  cmd.watch:
    - name:        gradle capsuleExecutor
    - cwd:        /usr/local/src/github.com/mesos/myriad
    - watch:
      - git:       https://github.com/mesos/myriad.git
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       mesos
    - watch:
      - cmd:      /usr/local/libexec/mesos/myriad-executor-x.x.x.jar
    - watch_in:
      - service:   mesos-slave
