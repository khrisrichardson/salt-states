# vi: set ft=yaml.jinja :

include:
  - .depend-golang-go
  - .depend-supervisor

/usr/bin/flanneld:
  file.symlink:
    - target:     /usr/local/src/github.com/coreos/flannel/bin/flanneld
