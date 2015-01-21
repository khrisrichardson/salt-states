# vi: set ft=yaml.jinja :

gem install supervisor:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list supervisor                                         \
                 | egrep -q supervisor
                 )
