# vi: set ft=yaml.jinja :

include:
  -  npm

log.io:
  npm.installed:
    - require:
      - pkg:       npm
      - cmd:       npm config set ca ""
