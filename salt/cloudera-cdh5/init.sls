# vi: set ft=yaml.jinja :

{% from  'cloudera-cdh5/map.jinja'
   import cloudera_cdh5
   with   context %}

include:
  -  procps
  -  python-apt

cloudera-cdh5:
  pkgrepo.managed:
    - name:     {{ cloudera_cdh5['pkgrepo']['name'] }}
    - file:     {{ cloudera_cdh5['pkgrepo']['file'] }}
    - gpgkey:   {{ cloudera_cdh5['pkgrepo']['key_url'] }}
    - key_url:  {{ cloudera_cdh5['pkgrepo']['key_url'] }}
    - humanname:   Cloudera's Distribution for Hadoop, Version 5
    - baseurl:     http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/4/
    - comps:       contrib
    - enabled:     1
    - gpgcheck:    1
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}

{% if not salt['config.get']('virtual_subtype') == 'Docker' %}

vm.swappiness:
  sysctl.present:
    - value:       0
    - require:
      - pkg:       procps

{% endif %}
