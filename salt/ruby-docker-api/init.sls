# vi: set ft=yaml.jinja :

gem install docker-api:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list docker-api                                         \
                 | egrep -q docker-api
                 )
