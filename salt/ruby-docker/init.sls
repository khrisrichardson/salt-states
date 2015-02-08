# vi: set ft=yaml.jinja :

gem install docker:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list docker                                             \
                 | egrep -q docker
                 )
