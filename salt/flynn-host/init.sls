# vi: set ft=yaml.jinja :

include:
  -  flynn
  -  sudo

flynn-host:
  pkg.installed:
    - require:
      - pkgrepo:   flynn
  service.running:
    - enable:      True
    - watch:
      - pkg:       flynn-host

/etc/flynn/version.json:
  cmd.wait:
    - name:        sudo flynn-host download /etc/flynn/version.json
    - require:
      - pkg:       sudo
    - watch:
      - pkg:       flynn-host
