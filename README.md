# salt-states

## Overview

My intention for posting this salt state tree is to stop hoarding the work that
I have done, and share with the community in the hopes of encouraging even
greater reciprocity.

I highly encourage folks to follow along on
[IRC](http://webchat.freenode.net/?channels=salt) and in the
[issues list](https://github.com/saltstack/salt/issues) to keep up to date on
freshly minted idiomatic ways of doing things with salt, particularly as new
core features or execution and state modules are introduced.

I have taken great pain to ensure that company sensitive data has been scrubbed
from the pillar and state trees. If you see anything amiss, I request your
immediate feedback.

## Features

### Operating Systems

The states support the following operating systems, and Mac OS X via brew to a
lesser extent, by way of
[map.jinja lookup tables](http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#when-to-use-lookup-tables).

  * CentOS
  * Debian
  * Ubuntu

The lookup tables are more favorable to Debian's more consistent conventions.

Pending git pre-commit hooks should catch discrepancies in OS support earlier
in the development process.

### Salt File Server

* gitfs

  As per
  [/etc/salt/minion.d/fileserver\_backend.conf](/salt/salt-minion/etc/salt/minion.d/fileserver_backend.conf)
  on the minion or
  [/etc/salt/master.d/fileserver\_backend.conf](/salt/salt-master/etc/salt/master.d/fileserver_backend.conf)
  on the master, and the very essence of your reading this on github, gitfs is
  the de rigueur salt file server that was chosen to host this state tree.

* roots

  You may have noticed that roots takes the highest precedence in the minion
  and master fileserver backend configurations. This is for the sake of testing
  changes to states on-the-fly without first requiring a commit to be pushed to
  git.

  I will cover how to take advantage of this in [Testing](#Testing) below.

### Architecture

* minion

  Supposing the minion has been bootstrapped to use gitfs, further configuration
  management of the minion can be performed without a master.

* minion/master

  To take advantage of remote execution, it is recommended to pair your minion
  with a master. Also to take advantage of service discovery and orchestration
  in its present state, a master is required.

### Service Registration and Discovery

Presently, roles are partitioned into namespaces by way of an environment
grain. The reason for using an environment grain as opposed to recycling
saltenv escapes me at the moment, but there was a shortcoming for which a
suitable workaround was elusive at the time, and is probably worth revisiting.

The inflexibility of this design is that one is limited to running a single set
of instances for a particular role/service, whereas one may opt to create
multiple of the same service within an environment. Kubernetes solves that
problem handily with labels. Adding support for labels would be desirable for
more flexible discovery.

  ```bash
  salt-call grains.setval environment base
  ```

* Salt mine

  Presently, the salt mine is the only means provided by the
  [roles custom execution module](/salt/_modules/roles.py) for service
  discovery. Since the salt mine is a salt master construct, the minion must be
  bootstrapped to connect with the
  [master](/salt/salt-minion/etc/salt/minion.d/salt-master.conf).

  When using the salt mine, no service registration other than the master
  accepting the minion's key is required.

* Etcd

  There is presently service registration supported with
  [etcd](/salt/salt-minion/relate-etcd.sls), but it assumes integration with
  skydns.

  This may be decoupled in the future.

* Skydns

  Service registration is supported via etcd integration, but service discovery
  with the [roles custom execution module](/salt/_modules/roles.py) is pending.

* Consul

  Both service registration and discovery are pending.

### Containers

All the states were developed with containers in mind, whether for testing or
production use. Storage durability is a general issue in containerized
environments, and these states make no exceptions in addressing that matter.

Other than syncing with distributed file systems (e.g. - Ceph), I have yet to
devise a general purpose solution. Any suggestions?

The following container runtimes are currently supported:

  * Docker

Support for the following container runtimes is planned:

  * LXD
  * rkt
  * systemd-nspawn

There were previously minimal Dockerfiles that inherited from a salt-minion
image and exposed service specific ports. This imposed a lot of redundancy,
which has since been relegated to an
[appc custom execution module](/salt/_modules/appc.py), which will support
multiple container runtimes.

Data that is common across container runtime implementations has been moved from
the Dockerfiles to defaults.yaml files, and the manifests are instead generated
on the fly.

There was an attempt made to include each low chunk of the highstate in an
individual layer for the purposes of sharing common layers with containers to
streamline the pull process. Due to difficulties with escaping newlines in the
low chunks, the plan is to use the same concept but switch from state.low to
state.sls\_id.

### Highstate

Per the [top.sls](/salt/top.sls), there's a one to one relationship between role
and state. The states have been written in such a manner that they will do the
bare minimum required for a service to serve requests in the shortest amount of
time.

### Dependency Management

Interchangeable dependencies are defined outside init.sls in depend-\*.sls state
files.

Presently the default set of dependencies are included in init, but that may
change. The dependencies may also at some point be reclassified as source,
build, integrate, etc. Such contextualization clues could lend insight into
which layers to preserve when building container images.

### Orchestration

Dependencies with services that may reside on other minions are defined in
relate-\*.sls files. The inspiration for this delineation of concerns was
Canonical's Juju orchestration system.

Relation states are not triggered by sls or highstate calls, but rather via a
[reactor](/salt/salt-master/srv/reactor/job/ret.sls). Once again, until other
service discovery mechanisms are supported, this implies the involvement of a
master.

## Testing

To test ideas before pushing commits to git:

### Docker

  If you have your own state tree at /srv/salt:

  ```bash
  docker run -it --rm=true --volume=/srv/salt:/srv/salt khrisrichardson/salt-minion /bin/bash
  vi /srv/salt/foo/bar/baz
  salt-call state.sls foo
  ```

  otherwise:

  ```bash
  docker run -it --rm=true khrisrichardson/salt-minion /bin/bash
  cd /srv
  ln -s /var/cache/salt/minion/files/base salt
  vi /srv/salt/foo/bar/baz
  salt-call state.sls foo
  ```

### git pre-commit hook

Once upon a time, there was a git pre-commit hook that did syntax validation,
linting, sls to file system integrity checks, and vice versa. There is a need
to reinstate that hook, which should enforce the following:

  * syntax validation
  * lint
  * ensure ' -%}' is not present in sls files
  * ensure '{{ sls }}' is replaced with '{{ psls }}' in {depend,relate}-*.sls files
  * ensure files mentioned in sls correspond to files on file system
  * ensure files on file system correspond to files mentioned in sls
  * ensure sls files corresponding to services or frontends have defaults.yaml files
  * ensure sls files corresponding to services or frontends have sensu tests
  * ensure all invokations of the roles module have corresponding relate states
  * ensure all relate states have corresponding invokations of the roles module
  * docker run --rm=true khrisrichardson/salt-minion salt-call state.sls *
  * docker run --rm=true khrisrichardson/salt-minion salt-call sensu.check

## Building

To build your own salt-minion Docker container image to use in place of
khrisrichardson/salt-minion:

  ```bash
  salt-call saltutil.sync_modules
  salt-call appc.publish ubuntu:latest salt-minion
  ```

Supposing that salt is setup to use the khrisrichardson/salt-states gitfs file
server, and until support is provided for other container runtimes, the
following will build a Docker container image for a salt-master. Any of the
states with a corresponding defaults.yaml file are eligible for building in this
manner.

  ```bash
  salt-call saltutil.sync_modules
  salt-call appc.publish ubuntu:latest salt-master
  ```

## Running

To run a salt-master container sans pre-built salt-master image:

  ```bash
  docker run -d -e roles=salt-master khrisrichardson/salt-minion
  ```

To test a salt-master container sans pre-built salt-master image:

  ```bash
  docker run --rm=true -e roles=salt-master khrisrichardson/salt-minion salt-call sensu.check
  ```

To run a salt-master container from pre-built salt-master image:

  ```bash
  salt-call saltutil.sync_modules
  salt-call appc.create ubuntu:latest salt-master
  ```

To test a salt-master container with pre-built salt-master image:

  ```bash
  salt-call saltutil.sync_modules
  salt-call appc.test ubuntu:latest salt-master
  ```

Support for running multiple interrelated containers was available prior to
replacing the redundant Dockerfiles and docker state modules, but is pending
with the refactoring to a common execution module.

The ultimate plan will be to provide the means to schedule containers using
Docker Swarm or Mesos for more sophisticated scheduling. The means to test this
will be provided via Vagrant.

## Contributing

Want to take any of the content herein to the next level? Great, I will accept
pull requests.

## Disclaimer

Please be advised that some of the states may use features only available in the
develop branch of salt on [github](https://github.com/saltstack/salt), although
the vast majority should be compatible with branch 2014.7.

Please note that while I have used a lot of the content herein in a production
setting, you are also likely to encounter some works in progress. I can make no
guarantees regarding the viability of this content in your specific environment.

Please review the material carefully before applying it as some of it may be
destructive and irreversible. Use at your own discretion.
