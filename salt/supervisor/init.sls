# vi: set ft=yaml.jinja :

include:
  -  logrotate
  -  python-pip

supervisor:
{% if   salt['config.get']('os_family') == 'RedHat' %}
  pip.installed:
    - require:
      - pkg:       python-pip
    - require_in:
      - file:     /usr/bin/supervisord
{% elif salt['config.get']('os_family') == 'Debian' %}
  pkg.installed:
    - require_in:
      - file:     /usr/bin/supervisord
{% endif %}
  service.running:
    - enable:      True
    - reload:      True
    - require:
      - file:     /usr/bin/supervisord

supervisorctl update &:
  cmd.wait:
    - order:      -1

{% if salt['config.get']('os_family') == 'RedHat' %}

/etc/logrotate.d/supervisor:
  file.managed:
    - source:      salt://{{ sls }}/etc/logrotate.d/supervisor
    - user:        root
    - group:       root
    - mode:       '0644'

/etc/rc.d/init.d/supervisor:
  file.managed:
    - source:      salt://{{ sls }}/etc/rc.d/init.d/supervisor
    - user:        root
    - group:       root
    - mode:       '0755'
    - require_in:
      - service:   supervisor

{% endif %}

/etc/supervisor:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'

/etc/supervisor/conf.d:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /etc/supervisor
    - require_in:
      - service:   supervisor

{% if salt['config.get']('os_family') == 'RedHat' %}

/etc/supervisor/supervisord.conf:
  file.managed:
    - source:      salt://{{ sls }}/etc/supervisor/supervisord.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/supervisor
    - watch_in:
      - cmd:       supervisorctl update &

/etc/supervisord.conf:
  file.symlink:
    - target:     /etc/supervisor/supervisord.conf
    - require:
      - file:     /etc/supervisor/supervisord.conf
    - require_in:
      - service:   supervisor

{% endif %}

/usr/bin/supervisord:
  file.exists:     []

{% if salt['config.get']('os_family') == 'RedHat' %}

/var/log/supervisor:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0770'
    - require_in:
      - service:   supervisor

{% endif %}
