# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'RedHat' %}

bsdtar-repo:
  pkgrepo.managed:
    - humanname: pixz for CentOS and RHEL (CentOS_CentOS-6)
    - baseurl: http://download.opensuse.org/repositories/home:/AndreasStieger:/branches:/Archiving/CentOS_CentOS-6/
    - gpgcheck: 1
    - gpgkey: http://download.opensuse.org/repositories/home:/AndreasStieger:/branches:/Archiving/CentOS_CentOS-6/repodata/repomd.xml.key

{% endif %}

bsdtar:
  pkg:
    - installed
{% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo: bsdtar-repo
{% endif %}
