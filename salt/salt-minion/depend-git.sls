# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  git
  -  openssh-client.known_hosts.github.com
  -  python-pygit2
  -  salt-minion

/etc/salt/minion.d/fileserver_backend.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/minion.d/fileserver_backend.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       python-pygit2
      - file:     /etc/salt/minion.d
    - watch_in:
      - service:   salt-minion
