# vi: set ft=yaml.jinja :

{% from  'newrelic/map.jinja'
   import newrelic
   with   context %}

include:
  -  python-apt

newrelic:
  pkgrepo.managed:
    - name:     {{ newrelic['pkgrepo']['name'] }}
    - file:     {{ newrelic['pkgrepo']['file'] }}
    - gpgkey:      https://download.newrelic.com/548C16BF.gpg
    - key_url:     https://download.newrelic.com/548C16BF.gpg
    - humanname:   New Relic packages for Enterprise Linux 5 - $basearch
    - baseurl:     http://yum.newrelic.com/pub/newrelic/el5/$basearch
    - comps:       non-free
    - enabled:     1
    - gpgcheck:    1
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
