# vi: set ft=yaml.jinja :

include:
  - .depend-apache2
  - .depend-git
  - .depend-logrotate
  - .depend-supervisor
  -  libpq-dev
  -  python-dev
  -  python-virtualenv

/etc/calamari:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'

/etc/calamari/alembic.ini:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/calamari/alembic.ini
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/calamari

/etc/calamari/calamari.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/calamari/calamari.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/calamari

/etc/init/kraken.conf:
  file.symlink:
    - target:     /opt/calamari/conf/upstart/kraken.conf

/opt/calamari:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'

/opt/calamari/plugins:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /opt/calamari

/var/lib/calamari:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'

/var/log/calamari:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
