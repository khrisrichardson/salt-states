# vi: set ft=yaml.jinja :

{% from 'libvirt-bin/map.jinja' import map with context %}

include:
  -  bridge-utils
  -  uuid-runtime

libvirt-bin:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
  service.running:
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       libvirt-bin

/etc/libvirt/libvirt.conf:
  file.managed:
    - source:      salt://{{ sls }}/etc/libvirt/libvirt.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/libvirtd.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/libvirtd.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/lxc.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/lxc.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/allow-arp.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/allow-arp.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/allow-dhcp-server.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/allow-dhcp-server.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/allow-dhcp.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/allow-dhcp.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/allow-incoming-ipv4.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/allow-incoming-ipv4.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/allow-ipv4.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/allow-ipv4.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/clean-traffic.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/clean-traffic.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/no-arp-ip-spoofing.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/no-arp-ip-spoofing.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/no-arp-mac-spoofing.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/no-arp-mac-spoofing.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/no-arp-spoofing.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/no-arp-spoofing.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/no-ip-multicast.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/no-ip-multicast.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/no-ip-spoofing.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/no-ip-spoofing.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/no-mac-broadcast.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/no-mac-broadcast.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/no-mac-spoofing.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/no-mac-spoofing.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/no-other-l2-traffic.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/no-other-l2-traffic.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/no-other-rarp-traffic.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/no-other-rarp-traffic.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/qemu-announce-self-rarp.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/qemu-announce-self-rarp.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/nwfilter/qemu-announce-self.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/nwfilter/qemu-announce-self.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/qemu-lockd.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/qemu-lockd.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/qemu.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/qemu.conf
    - user:        root
    - group:       root
    - mode:       '0600'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/qemu/networks/default.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/qemu/networks/default.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/virt-login-shell.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/virt-login-shell.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/libvirt/virtlockd.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/libvirt/virtlockd.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin

/etc/sasl2/libvirt.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/sasl2/libvirt.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       libvirt-bin
    - watch_in:
      - service:   libvirt-bin
