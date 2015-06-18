# vi: set ft=yaml.jinja :

qemu:
  pkg.installed:   []
  service.running:
    - enable:      True
    - watch:
      - pkg:       qemu
