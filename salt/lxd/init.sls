# vi: set ft=yaml.jinja :

include:
  - .depend-golang-go
  - .depend-supervisor

/etc/subgid:
  file.append:
    - text:        root:1000000:65536

/etc/subuid:
  file.append:
    - text:        root:1000000:65536

/usr/bin/lxc:
  file.symlink:
    - target:     /usr/local/src/github.com/lxc/lxd/lxc/lxc
    - require:
      - cmd:       go build lxd

/usr/bin/lxc:
  file.symlink:
    - target:     /usr/local/src/github.com/lxc/lxd/lxd/lxd
    - require:
      - cmd:       go build lxd

/var/lib/lxd:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
