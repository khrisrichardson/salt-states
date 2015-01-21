# vi: set ft=yaml.jinja :

gem install redis:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list redis                                              \
                 | egrep -q redis
                 )
