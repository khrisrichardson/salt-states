# vi: set ft=yaml.jinja :

include:
  -  zlib1g-dev

ruby-jenkins_api_client:
  gem.installed:
    - name:        jenkins_api_client
    - require:
      - pkg:       zlib1g-dev
