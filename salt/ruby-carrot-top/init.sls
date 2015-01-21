# vi: set ft=yaml.jinja :

gem install carrot-top:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list carrot-top                                         \
                 | egrep -q carrot-top
                 )
