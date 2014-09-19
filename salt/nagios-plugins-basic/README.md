# nagios-plugins-basic

## Description:

Plugins for nagios compatible monitoring systems like Nagios and Icinga. It contains the following plugins:

check_apt, check_by_ssh, check_clamd, check_cluster,
check_dhcp, check_disk, check_dummy, check_file_age,
check_ftp, check_host, check_http, check_icmp,
check_ide_smart, check_imap, check_ircd, check_jabber,
check_load, check_log, check_mrtg, check_mrtgtraf,
check_nagios, check_nntp, check_nntps, check_nt,
check_ntp, check_ntp_peer, check_ntp_time, check_nwstat,
check_overcr,  check_ping, check_pop, check_procs,
check_real, check_rta_multi, check_sensors, check_simap,
check_smtp, check_spop, check_ssh, check_ssmtp,
check_swap, check_tcp, check_time, check_udp,
check_ups, check_users
This package provides a basic set of plugins with minimal external dependencies.  It is not likely to be useful by itself unless you are using a remote "satellite" system (using nagios-nrpe-server, check_by_ssh or nsca, for example).

## Depends:

  -  [bash] (salt/bash)
  -  [openssh-server.relate-nagios3] (salt/openssh-server.relate-nagios3)

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── init.sls
└── usr
    └── lib
        └── nagios
            └── plugins
                └── check_mem.pl

4 directories, 2 files
```
