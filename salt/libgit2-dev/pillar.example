# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

libgit2-dev:
  pkg:
    name:          libgit2-devel

{% elif salt['config.get']('os_family') == 'Debian' %}

libgit2-dev:
  pkg:
    name:          libgit2-dev

{% endif %}
