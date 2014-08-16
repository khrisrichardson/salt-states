# vi: set ft=yaml.jinja :

krb5-config:
  pkg.installed:   []

/etc/krb5.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/krb5.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       krb5-config
