# vi: set ft=yaml.jinja :

include:
  -  curl
  -  gnupg

curl https://rvm.io/mpapis.asc:
  cmd.run:
    - name:      |-
                 ( curl -sSL https://rvm.io/mpapis.asc                         \
                 | gpg --import -
                 )
    - require:
      - pkg:       curl
      - pkg:       gnupg
    - require_in:
      - cmd:       curl https://get.rvm.io

curl https://get.rvm.io:
  cmd.run:
    - name:      |-
                 ( curl -L https://get.rvm.io                                  \
                 | bash -s stable
                 )
    - unless:      test -d /usr/local/rvm/
    - require:
      - pkg:       curl
