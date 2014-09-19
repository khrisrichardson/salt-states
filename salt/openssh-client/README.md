# openssh-client

## Description:

This is the portable version of OpenSSH, a free implementation of the Secure Shell protocol as specified by the IETF secsh working group.

Ssh (Secure Shell) is a program for logging into a remote machine and for executing commands on a remote machine. It provides secure encrypted communications between two untrusted hosts over an insecure network. X11 connections and arbitrary TCP/IP ports can also be forwarded over the secure channel. It can be used to provide applications with a secure communication channel.

This package provides the ssh, scp and sftp clients, the ssh-agent and ssh-add programs to make public key authentication more convenient, and the ssh-keygen, ssh-keyscan, ssh-copy-id and ssh-argv0 utilities.

In some countries it may be illegal to use any encryption at all without a special permit.

ssh replaces the insecure rsh, rcp and rlogin programs, which are obsolete for most purposes.

## Depends:

  -  N/A

## Reverse Depends:

  -  [jenkins](salt/jenkins)
  -  [puppetmaster](salt/puppetmaster)
  -  [salt-master](salt/salt-master)

## Relates:

  -  N/A

## Files:

```bash
.
├── init.sls
├── known_hosts
│   └── github
│       └── com
│           └── init.sls
└── root

4 directories, 2 files
```
