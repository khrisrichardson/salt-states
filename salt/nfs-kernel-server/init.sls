# vi: set ft=yaml.jinja :

{% from 'nfs-kernel-server/map.jinja' import map with context %}

nfs-kernel-server:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - watch:
      - pkg:       nfs-kernel-server
