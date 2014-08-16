# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

python-repoze_lru:
  pkg:
    name:          python-repoze-lru

{% elif salt['config.get']('os_family') == 'Debian' %}

python-repoze_lru:
  pkg:
    name:          python-repoze.lru

{% endif %}
