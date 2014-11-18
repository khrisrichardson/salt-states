# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

vim:
  pkg:
    name:          vim-enhanced

{% elif salt['config.get']('os_family') == 'Debian' %}

vim:
  pkg:
    name:          vim

{% endif %}
