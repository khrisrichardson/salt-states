# vi: set ft=yaml.jinja :

{% from 'sensu/map.jinja' import map with context %}

include:
  - .depend-git
  -  bc
  -  python-apt
  -  python-psutil
  -  sysstat

sensu:
  pkgrepo.managed:
    - humanname:   Sensu
    - name:     {{ map.get('pkgrepo', {}).get('name') }}
    - file:     {{ map.get('pkgrepo', {}).get('file') }}
    - baseurl:     http://repos.sensuapp.org/yum/el/$releasever/$basearch/
    - key_url:     http://repos.sensuapp.org/apt/pubkey.gpg
    - enabled:     1
    - gpgcheck:    0
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
  pkg.installed:
    - order:      -1
    - require:
      - pkgrepo:   sensu

/etc/default/sensu:
  file.replace:
    - pattern:     EMBEDDED_RUBY=false
    - repl:        EMBEDDED_RUBY=true
    - watch:
      - pkg:       sensu

/etc/sensu:
  file.directory:
    - user:        sensu
    - group:       sensu
    - mode:       '0755'
    - require:
      - pkg:       sensu

/etc/sensu/conf.d:
  file.directory:
    - user:        sensu
    - group:       sensu
    - mode:       '0755'
    - require:
      - file:     /etc/sensu
