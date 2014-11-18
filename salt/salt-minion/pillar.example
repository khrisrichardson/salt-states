# vi: set ft=yaml.jinja :

mine_functions:
  cmd.run:
    - 'awk "!/0 0 0 0 0 0 0 0 0 0 0/ {print \$3}" /proc/diskstats | sort'
  grains.item:
    - cpuarch
    - environment
    - fqdn_ip4
    - kernelrelease
    - ipv4
    - num_cpus
    - mem_total
    - os
    - osrelease
    - roles
    - saltversion
    - virtual
  mount.active:         []
  network.interfaces:   []
  ps.num_cpus:          []

mine_interval:          60
