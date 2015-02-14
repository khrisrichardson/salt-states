# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  aurora
  -  build-essential
  -  default-jdk
  -  unzip

./gradlew distZip:
  cmd.run:
    - cwd:        /usr/local/src/git-wip-us.apache.org/repos/asf/incubator-aurora
    - require:
      - pkg:       build-essential
      - pkg:       default-jdk
    - watch:
      - git:       http://git-wip-us.apache.org/repos/asf/incubator-aurora.git

unzip /usr/local/src/git-wip-us.apache.org/repos/asf/incubator-aurora/dist/distributions/aurora-scheduler-*.zip:
  cmd.run:
    - cwd:        /usr/local
    - require:
      - pkg:       unzip
    - watch:
      - cmd:     ./gradlew distZip

/usr/local/aurora-scheduler:
  file.symlink:
    - target:   {{ salt['cmd.run']('ls -dt /usr/local/aurora-scheduler-* | head -1') }}
    - require:
      - cmd:       unzip /usr/local/src/git-wip-us.apache.org/repos/asf/incubator-aurora/dist/distributions/aurora-scheduler-*.zip

/usr/local/aurora-scheduler/bin/schedule.sh:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/usr/local/aurora-scheduler/bin/schedule.sh
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /usr/local/aurora-scheduler
