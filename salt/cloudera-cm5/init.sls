# vi: set ft=yaml.jinja :

{% from  'cloudera-cm5/map.jinja'
   import cloudera_cm5
   with   context %}

include:
  -  netbase
  -  python-apt

cloudera-cm5:
  pkgrepo.managed:
    - name:     {{ cloudera_cm5['pkgrepo']['name'] }}
    - file:     {{ cloudera_cm5['pkgrepo']['file'] }}
    - gpgkey:   {{ cloudera_cm5['pkgrepo']['key_url'] }}
    - key_url:  {{ cloudera_cm5['pkgrepo']['key_url'] }}
    - humanname:   Cloudera Manager
    - baseurl:     http://archive.cloudera.com/cm5/redhat/6/x86_64/cm/5/
    - comps:       contrib
    - enabled:     1
    - gpgcheck:    1
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
