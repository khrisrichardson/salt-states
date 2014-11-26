# vi: set ft=yaml.jinja :

include:
  -  ruby-dev

{% if salt['config.get']('os_family') == 'Debian' %}

ruby-ffi-rzmq:
  gem.installed:
    - name:        ffi-rzmq
    - require:
      - pkg:       ruby-dev
# pkg.installed:   []

{% endif %}
