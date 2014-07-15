# vi: set ft=yaml.jinja :

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  supervisor

/etc/bash.bashrc:
  file.append:
    - text:        ps -C supervisord &>- || supervisord &>-
    - watch:
      - pkg:       supervisor

{% endif %}
