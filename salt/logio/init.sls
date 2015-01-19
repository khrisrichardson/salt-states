# vi: set ft=yaml.jinja :

include:
  -  npm

log.io:
  npm.installed:
    - user:        ubuntu
    - require:
      - pkg:       npm
      - cmd:       npm config set ca ""
