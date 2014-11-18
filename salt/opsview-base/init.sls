# vi: set ft=yaml.jinja :

{% from  'opsview-base/map.jinja'
   import opsview_base
   with   context %}

include:
  -  python-apt
  -  rpmforge-release

opsview-base:
  pkgrepo.managed:
    - name:     {{ opsview_base['pkgrepo']['name'] }}
    - file:     {{ opsview_base['pkgrepo']['file'] }}
    - gpgkey:   {{ opsview_base['pkgrepo']['key_url'] }}
    - key_url:  {{ opsview_base['pkgrepo']['key_url'] }}
    - humanname:   Opsview
    - baseurl:     http://downloads.opsview.com/opsview-core/latest/yum/centos/6/$basearch
    - enabled:     1
    - gpgcheck:    0
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
  pkg.installed:
    - require:
      - pkgrepo:   opsview-base
