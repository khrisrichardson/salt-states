# vi: set ft=yaml.jinja :

python-dev:
  pkg.installed:
    - name:     {{ salt['config.get']('python-dev:pkg:name') }}
