#!/usr/bin/env bash

set -x

repository=https://github.com/khrisrichardson/salt-states.git
       ref=master
 minion_id=$( hostname -f )

export DEBIAN_FRONTEND=noninteractive
export             PS4='$( date "+%s.%N ($LINENO) + " )'
export       bootstrap=true

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  main
#   DESCRIPTION:  Core logic.
#-------------------------------------------------------------------------------
main() {
    if ! which salt-call &>/dev/null
    then
        apt_setup
        salt_bootstrap "${@}"
        salt_master_setup
        salt_minion_setup
        salt_run_gitfs_update
    fi
    salt_key_gen_keys
    salt_master_daemonize
    salt_call_state_highstate
    salt_cleanup
    apt_cleanup
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  apt_cleanup
#   DESCRIPTION:  Clear apt cache.
#-------------------------------------------------------------------------------
apt_cleanup() {
  (
    apt-get -y clean
    apt-get -y autoclean
    apt-get -y autoremove
  ) &
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  apt_setup
#   DESCRIPTION:  Configure apt to use caching proxy.
#-------------------------------------------------------------------------------
apt_setup() {
    cat > /etc/apt/apt.conf.d/30proxy                                   <<-EOF
	Acquire::http::Proxy "http://172.17.42.1:3142";
	Acquire::http::Proxy::download.oracle.com "DIRECT";
	EOF
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  salt_bootstrap
#   DESCRIPTION:  Download and execute salt bootstrap script.
#-------------------------------------------------------------------------------
salt_bootstrap() {
    python3                                                             <<-EOF
	import urllib.request
	urllib.request.urlretrieve("https://bootstrap.saltstack.com",
	                           "bootstrap-salt.sh")
	EOF
    bash bootstrap-salt.sh -MX -p python-git "${@}"                            \
 || true
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  salt_call_state_highstate
#   DESCRIPTION:  Set environment, referenced by top.sls, and run highstate.
#-------------------------------------------------------------------------------
salt_call_state_highstate() {
    if ! grep -q environment /etc/salt/grains
    then
        if [[ "${ref}" =~ "master" ]]
        then
            environment=base
        else
            environment=${ref}
        fi
    salt-call grains.setval environment ${environment} --local
    fi
    salt-call state.highstate                                                  \
 || exit ${?}
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  salt_cleanup
#   DESCRIPTION:  Remove unneeded salt files.
#-------------------------------------------------------------------------------
salt_cleanup() {
    if       grep -q roles       /etc/salt/grains
    then
        if ! grep -q salt-master /etc/salt/grains
        then
                     salt_master_cleanup
        fi
        if ! grep -q salt-syndic /etc/salt/grains
        then
                     salt_syndic_cleanup
        fi
    fi
    salt_minion_cleanup
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  salt_key_gen_keys
#   DESCRIPTION:  Preseed minion's cryptographic keys on master.
#-------------------------------------------------------------------------------
salt_key_gen_keys() {
    if ! test -f            /etc/salt/pki/minion/minion.pub
    then
        mkdir -p            /etc/salt/pki/master/minions
        mkdir -p            /etc/salt/pki/minion
        chmod 0700          /etc/salt/pki
        chmod 0700          /etc/salt/pki/master
        chmod 0700          /etc/salt/pki/minion
        salt-key --gen-keys=${minion_id}
        cp ${minion_id}.pub /etc/salt/pki/master/minions/${minion_id}
        mv ${minion_id}.pub /etc/salt/pki/minion/minion.pub
        mv ${minion_id}.pem /etc/salt/pki/minion/minion.pem
    fi
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  salt_master_cleanup
#   DESCRIPTION:  Remove all traces of salt-master.
#-------------------------------------------------------------------------------
salt_master_cleanup() {
    which supervisorctl                  &>/dev/null                           \
    &&    supervisorctl stop salt-master &>/dev/null
    pkill                    salt-master &>/dev/null

    rm -rf /etc/init*/salt-master*
    rm -rf /etc/salt/master*
    rm -rf /etc/salt/minion.d/master.conf
    rm -rf /etc/salt/pki/master
    rm -rf /etc/salt/pki/minion/minion_master.pub
    rm -rf /etc/supervisor/conf.d/salt-master.conf
    rm -rf /lib/systemd/system/salt-master.service
    rm -rf /run/salt-master*
    rm -rf /usr/bin/salt
    rm -rf /usr/bin/salt-cp
    rm -rf /usr/bin/salt-key
    rm -rf /usr/bin/salt-master
    rm -rf /usr/bin/salt-run
    rm -rf /usr/share/man/man1/salt.1*
    rm -rf /usr/share/man/man1/salt-cp.1*
    rm -rf /usr/share/man/man1/salt-key.1*
    rm -rf /usr/share/man/man1/salt-master.1*
    rm -rf /usr/share/man/man1/salt-run.1*
    rm -rf /var/cache/salt/master
    rm -rf /var/log/salt/master
    rm -rf /var/log/supervisor/salt-master-*.log
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  salt_master_daemonize
#   DESCRIPTION:  Daemonize salt-master, required for gitfs.
#-------------------------------------------------------------------------------
salt_master_daemonize() {
    pkill salt-master &>/dev/null
          salt-master -d
    until salt-call test.ping &>/dev/null
    do
        sleep 0.1
    done
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  salt_master_setup
#   DESCRIPTION:  Configure salt-master.
#-------------------------------------------------------------------------------
salt_master_setup() {
    mkdir -p /etc/salt/master.d
    cat >    /etc/salt/master.d/auto_accept.conf                        <<-EOF
	auto_accept:       True
	EOF

    cat >    /etc/salt/master.d/fileserver_backend.conf                 <<-EOF
	fileserver_backend:
	  - git
	  - minion

	gitfs_provider:    gitpython
	gitfs_remotes:
	  - ${repository}
	gitfs_root:        salt

	ext_pillar:
	  - git:           ${ref} ${repository} root=pillar
	EOF
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  salt_minion_cleanup
#   DESCRIPTION:  Remove intermediate files on salt-minion.
#-------------------------------------------------------------------------------
salt_minion_cleanup() {
    which supervisorctl                  &>/dev/null                           \
    &&    supervisorctl stop salt-minion &>/dev/null
    pkill                    salt-minion &>/dev/null

    rm -rf /etc/salt/minion_id
    rm -rf /etc/salt/pki/*/*
    rm -rf /var/run/gunicorn/*                                                 \
 || true
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  salt_minion_setup
#   DESCRIPTION:  Configure salt-minion.
#-------------------------------------------------------------------------------
salt_minion_setup() {
    if [[ "${ref}" =~ "master" ]]
    then
        environment=base
    else
        environment=${ref}
    fi
    mkdir -p /etc/salt/minion.d
    cat    > /etc/salt/minion.d/environment.conf                        <<-EOF
	environment:       ${environment}
	EOF

    cat    > /etc/salt/minion.d/master.conf                             <<-EOF
	master:            127.0.0.1
	EOF
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  salt_run_gitfs_update
#   DESCRIPTION:  Fetch latest salt and pillar files from git.
#-------------------------------------------------------------------------------
salt_run_gitfs_update() {
    salt-run     fileserver.update
    salt-run     git_pillar.update                                             \
                 branch=${ref}                                                 \
                 repo=${repository}
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  salt_syndic_cleanup
#   DESCRIPTION:  Remove all traces of salt-syndic.
#-------------------------------------------------------------------------------
salt_syndic_cleanup() {
    which supervisorctl                  &>/dev/null                           \
    &&    supervisorctl stop salt-syndic &>/dev/null
    pkill                    salt-syndic &>/dev/null

    rm -rf /etc/init*/salt-syndic*
    rm -rf /etc/supervisor/conf.d/salt-syndic.conf
    rm -rf /lib/systemd/system/salt-syndic.service
    rm -rf /run/salt-syndic*
    rm -rf /usr/bin/salt-syndic
    rm -rf /usr/share/man/man1/salt-syndic.1*
    rm -rf /var/log/salt/syndic
    rm -rf /var/log/supervisor/salt-syndic-*.log
}

main "${@}"
