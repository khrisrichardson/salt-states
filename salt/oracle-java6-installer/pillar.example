# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

oracle-java6-installer:
  pkg:
    name:          jdk

{% elif salt['config.get']('os_family') == 'Debian' %}

oracle-java6-installer:
  pkg:
    name:          oracle-java6-installer

{% endif %}
