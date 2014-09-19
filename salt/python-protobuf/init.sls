# vi: set ft=yaml.jinja :

python-protobuf:
  pkg.installed:
    - name:     {{ salt['config.get']('python-protobuf:pkg:name') }}
