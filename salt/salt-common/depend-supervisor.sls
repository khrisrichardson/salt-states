# vi: set ft=yaml.jinja :

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  bash
  -  supervisor

extend:
  /etc/bash.bashrc:
    file:
      - text:    |-
                   ps -C supervisord &>/dev/null \
                      || supervisord -c /etc/supervisor/supervisord.conf &>/dev/null

{% endif %}
