# vi: set ft=yaml.jinja :

{% from  'php5/map.jinja'
   import php5
   with   context %}

{% if salt['config.get']('os_family') == 'RedHat' %}

ius:
  pkgrepo.managed:
    - humanname:   IUS Community Packages for Enterprise Linux 6 - $basearch
    - mirrorlist:  http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-centos6&arch=$basearch
    - gpgkey:      http://dl.iuscommunity.org/pub/ius/IUS-COMMUNITY-GPG-KEY
    - enabled:     1
    - gpgcheck:    1

{% endif %}

php5:
  pkg.installed:
    - name:     {{ php5['pkg']['name'] }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   ius
   {% endif %}
