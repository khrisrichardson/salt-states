# vi: set ft=yaml.jinja :

include:
  -  npm

{% if salt['config.get']('os')         == 'Ubuntu'
  and salt['config.get']('oscodename') == 'precise' %}

chris-lea_node.js:
  pkgrepo.managed:
    - ppa:         chris-lea/node.js
    - require_in:
      - pkg:       nodejs

{% endif %}

nodejs:
  pkg.installed:
    - require_in:
      - pkg:       npm

{% if salt['config.get']('os_family') == 'Debian' %}

/usr/bin/node:
  file.symlink:
    - target:     /usr/bin/nodejs
    - require:
      - pkg:       nodejs

{% endif %}
