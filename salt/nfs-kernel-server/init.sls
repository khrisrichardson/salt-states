# vi: set ft=yaml.jinja :

nfs-kernel-server:
  pkg.installed:
    - name:     {{ salt['config.get']('nfs-kernel-server:pkg:name') }}
  service.running:
    - name:     {{ salt['config.get']('nfs-kernel-server:service:name') }}
    - enable:      True
    - watch:
      - pkg:       nfs-kernel-server
