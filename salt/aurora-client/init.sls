# vi: set ft=yaml.jinja :

include:
  -  aurora
  -  curl
  -  openjdk-7-jdk
  -  python-dev

./pants binary src/main/python/apache/aurora/client/cli:aurora:
  cmd.watch:
    - cwd:        /usr/local/src/git-wip-us.apache.org/repos/asf/incubator-aurora
    - require:
      - pkg:       curl
      - pkg:       openjdk-7-jdk
      - pkg:       python-dev
    - watch:
      - git:       http://git-wip-us.apache.org/repos/asf/incubator-aurora.git

/etc/aurora:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'

/etc/aurora/clusters.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/aurora/clusters.json
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/aurora

/usr/bin/aurora:
  file.symlink:
    - target:     /usr/local/src/git-wip-us.apache.org/repos/asf/incubator-aurora/dist/aurora.pex
    - require:
      - cmd:     ./pants binary src/main/python/apache/aurora/client/cli:aurora
