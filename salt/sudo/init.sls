# vi: set ft=yaml.jinja :

sudo:
  pkg.installed:   []

/etc/sudoers:
  file.replace:
    - pattern:  '^Defaults    requiretty'
    - repl:     '#Defaults    requiretty'
    - require:
      - pkg:       sudo
