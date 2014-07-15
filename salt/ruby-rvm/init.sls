# vi: set ft=yaml.jinja :

include:
  -  curl

/usr/local/rvm:
  cmd.run:
    - name:      |-
                 ( curl -L https://get.rvm.io                                  \
                 | bash -s stable
                 )
    - unless:      test -d /usr/local/rvm/
    - require:
      - pkg:       curl
