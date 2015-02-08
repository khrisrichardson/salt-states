# vi: set ft=yaml.jinja :

include:
  -  zlib1g-dev

gem install jenkins_api_client:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list jenkins_api_client                                 \
                 | egrep -q jenkins_api_client
                 )
    - require:
      - pkg:       zlib1g-dev
