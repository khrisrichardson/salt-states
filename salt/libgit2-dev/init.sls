# vi: set ft=yaml.jinja :

libgit2-dev:
  pkg.latest:
    - name:     {{ salt['config.get']('libgit2-dev:pkg:name') }}
