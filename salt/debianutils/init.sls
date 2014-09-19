# vi: set ft=yaml.jinja :

debianutils:
  pkg.installed:
    - name:     {{ salt['config.get']('debianutils:pkg:name') }}
