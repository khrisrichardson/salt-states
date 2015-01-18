# openssh-server

## Description:

This is the portable version of OpenSSH, a free implementation of the Secure Shell protocol as specified by the IETF secsh working group.

Ssh (Secure Shell) is a program for logging into a remote machine and for executing commands on a remote machine. It provides secure encrypted communications between two untrusted hosts over an insecure network. X11 connections and arbitrary TCP/IP ports can also be forwarded over the secure channel. It can be used to provide applications with a secure communication channel.

This package provides the sshd server.

In some countries it may be illegal to use any encryption at all without a special permit.

sshd replaces the insecure rshd program, which is obsolete for most purposes.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [ceph](/salt/ceph)
  -  [nagios-plugins-basic](/salt/nagios-plugins-basic)

## Relates:

  -  [cacti](/salt/cacti)
  -  [nagios3](/salt/nagios3)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-openssh-server.json
├── init.sls
├── map.jinja
├── relate-cacti.sls
├── relate-nagios3.sls
├── relate-sensu-api.sls
└── root
    └── .ssh
        └── id_rsa.pub.krichardson
```
