# vi: set ft=yaml.jinja :

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  bash
  -  supervisor

extend:
  /etc/bash.bashrc:
    file:
      - text:    |-
                {% if salt['config.get']('file_client') == 'local' %}
                   ps -C salt-call   &>/dev/null \
                      || salt-call state.highstate &
                {% endif %}
                   ps -C supervisord &>/dev/null \
                      || supervisord -c /etc/supervisor/supervisord.conf &>/dev/null

{% endif %}
