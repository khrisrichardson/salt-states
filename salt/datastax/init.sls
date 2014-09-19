# vi: set ft=yaml.jinja :

include:
  -  python-apt

datastax:
  pkgrepo.managed:
    - name:     {{ salt['config.get']('cassandra:pkgrepo:name') }}
    - file:     {{ salt['config.get']('cassandra:pkgrepo:file') }}
    - gpgkey:      http://debian.datastax.com/debian/repo_key
    - key_url:     http://debian.datastax.com/debian/repo_key
    - humanname:   DataStax Repo for Apache Cassandra
    - baseurl:     http://rpm.datastax.com/community
    - enabled:     1
    - gpgcheck:    0
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
