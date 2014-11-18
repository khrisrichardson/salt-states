# vi: set ft=yaml.jinja :

{% from  'jenkins-common/map.jinja'
   import jenkins_common
   with   context %}

include:
  -  python-apt

jenkins-common:
  pkgrepo.managed:
    - name:     {{ jenkins_common['pkgrepo']['name'] }}
    - file:     {{ jenkins_common['pkgrepo']['file'] }}
    - gpgkey:   {{ jenkins_common['pkgrepo']['key_url'] }}
    - key_url:  {{ jenkins_common['pkgrepo']['key_url'] }}
    - humanname:   Jenkins
    - baseurl:     http://pkg.jenkins-ci.org/redhat
    - enabled:     1
    - gpgcheck:    1
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
