# vi: set ft=yaml.jinja :

include:
  -  flynn
  -  libvirt-bin
  -  sudo

flynn-host:
  pkg.installed:
    - require:
      - pkgrepo:   flynn
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
{% endif %}
    - watch:
      - pkg:       flynn-host
      - service:   libvirt-bin

/etc/flynn/version.json:
  cmd.wait:
    - name:        sudo flynn-host download /etc/flynn/version.json
    - require:
      - pkg:       sudo
    - watch:
      - pkg:       flynn-host
