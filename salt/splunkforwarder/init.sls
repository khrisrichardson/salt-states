# vi: set ft=yaml.jinja :

#-------------------------------------------------------------------------------
# TODO: migrate binaries to ipa2 or repoman
#-------------------------------------------------------------------------------

splunkforwarder:
  pkg.installed:
    - order:      -1
   {% if   salt['config.get']('os_family') == 'Debian' %}
    - sources:
      - splunkforwarder: salt://{{ sls }}/splunkforwarder-6.0-182037-linux-2.6-amd64.deb
   {% elif salt['config.get']('os_family') == 'RedHat' %}
    - sources:
      - splunkforwarder: salt://{{ sls }}/splunkforwarder-6.0-182037-linux-2.6-x86_64.rpm
   {% endif %}
