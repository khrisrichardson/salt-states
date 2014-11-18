# vi: set ft=yaml.jinja :

{% from  'nfs-kernel-server/map.jinja'
   import nfs_kernel_server
   with   context %}

nfs-kernel-server:
  pkg.installed:
    - name:     {{ nfs_kernel_server['pkg']['name'] }}
  service.running:
    - name:     {{ nfs_kernel_server['service']['name'] }}
    - enable:      True
    - watch:
      - pkg:       nfs-kernel-server
