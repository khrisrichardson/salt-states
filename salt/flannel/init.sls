# vi: set ft=yaml.jinja :

include:
  - .depend-golang-go
  - .depend-supervisor

/usr/bin/flannel:
  file.symlink:
    - target:     /usr/share/flannel/flannel
    - watch:
      - file:     /usr/share/flannel
