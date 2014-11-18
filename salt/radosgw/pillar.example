# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

radosgw:
  pkg:
    name:          ceph-radosgw

{% elif salt['config.get']('os_family') == 'Debian' %}

radosgw:
  pkg:
    name:          radosgw

{% endif %}
