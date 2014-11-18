# vi: set ft=yaml.jinja :

{% from  'cloudera-cdh4/map.jinja'
   import cloudera_cdh4
   with   context %}

include:
  -  procps
  -  python-apt

cloudera-cdh4:
  pkgrepo.managed:
    - name:     {{ cloudera_cdh4['pkgrepo']['name'] }}
    - file:     {{ cloudera_cdh4['pkgrepo']['file'] }}
    - gpgkey:   {{ cloudera_cdh4['pkgrepo']['key_url'] }}
    - key_url:  {{ cloudera_cdh4['pkgrepo']['key_url'] }}
    - humanname:   Cloudera's Distribution for Hadoop, Version 4
    - baseurl:     http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/4/
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
