# nagios-plugins-basic

## Description:

Plugins for nagios compatible monitoring systems like Nagios and Icinga. It contains the following plugins:

check\_apt, check\_by\_ssh, check\_clamd, check\_cluster,
check\_dhcp, check\_disk, check\_dummy, check\_file\_age,
check\_ftp, check\_host, check\_http, check\_icmp,
check\_ide\_smart, check\_imap, check\_ircd, check\_jabber,
check\_load, check\_log, check\_mrtg, check\_mrtgtraf,
check\_nagios, check\_nntp, check\_nntps, check\_nt,
check\_ntp, check\_ntp\_peer, check\_ntp\_time, check\_nwstat,
check\_overcr,  check\_ping, check\_pop, check\_procs,
check\_real, check\_rta\_multi, check\_sensors, check\_simap,
check\_smtp, check\_spop, check\_ssh, check\_ssmtp,
check\_swap, check\_tcp, check\_time, check\_udp,
check\_ups, check\_users
This package provides a basic set of plugins with minimal external dependencies.  It is not likely to be useful by itself unless you are using a remote "satellite" system (using nagios-nrpe-server, check\_by\_ssh or nsca, for example).

## Depends:

  -  [bash](/salt/bash)
  -  [openssh-server.relate-nagios3](/salt/openssh-server/relate-nagios3.sls)

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
```
