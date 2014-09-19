# nagios3

## Description:

Nagios is a monitoring and management system for hosts, services and networks.

Nagios' features include:

*  Monitoring of network services (via TCP port, SMTP, POP3, HTTP, NNTP,
   PING, etc.)
*  Plugin interface to allow for user-developed service checks
*  Contact notifications when problems occur and get resolved (via email,
   pager, or user-defined method)
*  Ability to define event handlers to be run during service or host events
   (for proactive problem resolution)
*  Web output (current status, notifications, problem history, log file, etc.)
Nagios was written in C and is designed to be easy to understand and modify to fit your own needs.

This is a metapackage which depends on the nagios core and the webfrontend

This package is the new version 3.x series of nagios, which replaced the 2.x versions.

Nagios is a replacement of the Netsaint project. It accepts and uses the previous Netsaint modules transparently.

Upstream URL: http://www.nagios.org/

## Depends:

  -  [apache2](/salt/apache2)
  -  [libapache2-mod-php5](/salt/libapache2-mod-php5)
  -  [nginx](/salt/nginx)
  -  [postfix](/salt/postfix)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-apache2.sls
├── depend-libapache2-mod-php5.sls
├── depend-nginx.sls
├── Dockerfile
├── etc
│   ├── nagios3
│   │   └── conf.d
│   │       ├── command-couchdb.cfg
│   │       ├── command-dhcp.cfg
│   │       ├── command-disk-clean.cfg
│   │       ├── command-hadoop-hdfs.cfg
│   │       ├── command-hadoop-hdfs-datanode.cfg
│   │       ├── command-hive-metastore.cfg
│   │       ├── command-http.cfg
│   │       ├── command-jmx.cfg
│   │       ├── command-load.cfg
│   │       ├── command-mapreduce-jobtracker.cfg
│   │       ├── command-membase.cfg
│   │       ├── command-memcached.cfg
│   │       ├── command-oozie.cfg
│   │       ├── command-pgsql.cfg
│   │       ├── command-rpc.cfg
│   │       ├── command-service-restart.cfg
│   │       ├── command-swap.cfg
│   │       ├── contact-generic.cfg
│   │       ├── host-compute-generic-centos.cfg
│   │       ├── host-compute-generic.cfg
│   │       ├── host-compute-generic-linux.cfg
│   │       ├── host-compute-generic-oracle.cfg
│   │       ├── host-compute-generic-redhat.cfg
│   │       ├── host-compute-generic-sunos.cfg
│   │       ├── host-compute-generic-ubuntu.cfg
│   │       ├── host-compute-generic-vmware.cfg
│   │       ├── host-compute-generic-windows.cfg
│   │       ├── host-network-generic.cfg
│   │       ├── host-network-generic-cisco.cfg
│   │       ├── host-storage-generic.cfg
│   │       ├── host-storage-generic-netapp.cfg
│   │       └── service-generic.cfg
│   ├── nginx
│   │   └── sites-available
│   │       └── nagios3
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nagios3.json
│   └── systemd
│       └── system
│           └── nagios3.service
├── init.sls
├── relate-sensu-api.sls
├── root
│   └── bin
│       └── nagios3.sh
└── usr
    ├── lib
    │   └── nagios
    │       └── plugins
    │           ├── check_aggregate.php
    │           ├── check_couchdb
    │           ├── check_cpu.pl
    │           ├── check_datanode_storage.php
    │           ├── check_hadoop.sh
    │           ├── check_hbase.sh
    │           ├── check_hdfs_blocks.php
    │           ├── check_hdfs_capacity.php
    │           ├── check_hive_metastore_status.sh
    │           ├── check_jmx
    │           ├── check_name_dir_status.php
    │           ├── check_oozie_status.sh
    │           ├── check_puppet_agent_status.php
    │           ├── check_rpcq_latency.php
    │           ├── check_templeton_status.sh
    │           ├── check_webui.sh
    │           ├── jmxquery.jar
    │           ├── nagios_send_host_mail.pl
    │           └── nagios_send_service_mail.pl
    └── share
        ├── nagios
        │   └── htdocs
        │       └── images
        │           └── logos
        │               └── base
        │                   ├── centos.gd2
        │                   ├── centos.gif
        │                   ├── centos.jpeg
        │                   ├── centos.png
        │                   ├── vmware2.gd2
        │                   ├── vmware2.gif
        │                   ├── vmware2.jpg
        │                   ├── vmware2.png
        │                   ├── vmware.gd2
        │                   ├── vmware.gif
        │                   ├── vmware.jpg
        │                   └── vmware.png
        └── nagios3
            └── plugins
                └── eventhandlers
                    ├── clean_disk
                    └── restart_service

25 directories, 76 files
```
