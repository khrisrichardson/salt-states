# vi: set ft=yaml.jinja :

include:
  - .depend-golang-go

/etc/mesos-dns:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
