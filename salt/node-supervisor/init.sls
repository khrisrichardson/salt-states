# vi: set ft=yaml.jinja :

include:
  -  npm

{% if   salt['config.get']('os_family') == 'RedHat' %}

nodejs-supervisor:
  pkg.installed:   []

{% elif salt['config.get']('os_family') == 'Debian' %}

npm-supervisor:
  npm.installed:
    - name:        supervisor
    - require:
      - pkg:       npm
      - cmd:       npm config set ca ""

{% endif %}
