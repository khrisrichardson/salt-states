# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor

salt-common:
  pkg.installed:
    - unless:    |-
                 ( salt-call   --version                                       \
                 | egrep -q '....\..\..+-'
                 )
