# salt-common

## Description:

salt is a powerful remote execution manager that can be used to administer servers in a fast and efficient way.

It allows commands to be executed across large groups of servers. This means systems can be easily managed, but data can also be easily gathered.  Quick introspection into running systems becomes a reality.

Remote execution is usually used to set up a certain state on a remote system. Salt addresses this problem as well, the salt state system uses salt state files to define the state a server needs to be in.

Between the remote execution system, and state management Salt addresses the backbone of cloud and data center management.

This particular package provides shared libraries that salt-master, salt-minion, and salt-syndic require to function.

## Depends:

  -  [bash] (salt/bash)
  -  [epel-release] (salt/epel-release)
  -  [supervisor] (salt/supervisor)

## Reverse Depends:

  -  [salt-halite] (salt/salt-halite)
  -  [salt-master] (salt/salt-master)
  -  [salt-minion] (salt/salt-minion)
  -  [salt-syndic] (salt/salt-syndic)

## Relates:

  -  N/A

## Files:

```bash
.
├── depend-supervisor.sls
├── etc
│   └── apt
│       └── apt.conf.d
│           └── 30proxy
└── init.sls

3 directories, 3 files
```
