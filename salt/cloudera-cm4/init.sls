# vi: set ft=yaml.jinja :

{% from  'cloudera-cm4/map.jinja'
   import cloudera_cm4
   with   context %}

include:
  -  netbase
  -  python-apt

cloudera-cm4:
  pkgrepo.managed:
    - name:     {{ cloudera_cm4['pkgrepo']['name'] }}
    - file:     {{ cloudera_cm4['pkgrepo']['file'] }}
    - gpgkey:   {{ cloudera_cm4['pkgrepo']['key_url'] }}
    - key_url:  {{ cloudera_cm4['pkgrepo']['key_url'] }}
    - humanname:   Cloudera Manager
    - baseurl:     http://archive.cloudera.com/cm4/redhat/6/x86_64/cm/4/
    - comps:       contrib
    - enabled:     1
    - gpgcheck:    1
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
