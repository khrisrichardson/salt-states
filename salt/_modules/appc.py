# -*- coding: utf-8 -*-
"""
Manage Linux Containers via assorted runtimes

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: linux
"""

# TODO: perform source and role validation
# TODO: add option to create all downstream containers for local testing
# TODO: add option to create individual relations for integration testing
# TODO: add option to execute sensu checks

# import libs: standard
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division
from collections import OrderedDict
from os.path import join
from pprint import pformat
from tempfile import mkdtemp

from yaml import load


__func_alias__ = {
    'exec_': 'exec',
    'file_': 'file',
}


def containers_create(
        role=None,
        runtime='docker',
        source_os='ubuntu',
        source_release='14.04',
        source_architecture='x86_64',
        source_alias=None,
        source_fingerprint=None,
):
    """
    Create container

    :param str role:
    :param str runtime:
    :param str source_os:
    :param str source_release:
    :param str source_architecture:
    :param str source_alias:
    :param str source_fingerprint:
    """
    volumes = lxc_conf_mount_entry_dir(role=role)
    if runtime == 'docker':
        if not source_alias:
            source_alias = ':'.join((source_os, source_release))
        ret = _containers_create_docker(
            role=role,
            source_alias=source_alias,
            source_fingerprint=source_fingerprint,
            volumes=volumes,
        )
    elif runtime == 'lxc':
        ret = _containers_create_lxc()
    elif runtime == 'lxd':
        ret = _containers_create_lxd()
    elif runtime == 'rkt':
        if not source_alias:
            source_alias = ':'.join((source_os, source_release))
        ret = _containers_create_rkt(
            role=role,
            source_alias=source_alias,
            source_fingerprint=source_fingerprint,
            volumes=volumes,
        )
    elif runtime == 'systemd-nspawn':
        ret = _containers_create_systemd_nspawn()
    else:
        ret = None
    return ret


def _containers_create_docker(
        role=None,
        source_alias=None,
        source_fingerprint=None,
        **kwargs
):
    """
    Create container with docker

    :param str role:
    :param str source_alias:
    :param str source_fingerprint:
    """
    _setup_docker()
    split = source_alias.split(':')
    if source_fingerprint:
        tag = '-'.join(split[:1] + [source_fingerprint])
    else:
        tag = split
    image = ':'.join((role, tag))
    ret = __salt__['docker.inspect_image'](image)
    if not ret['status']:
        images_create(
            role=role,
            source_alias=source_alias,
            source_fingerprint=source_fingerprint,
        )
    ret = containers_state_list(
        role=role,
        runtime='docker',
        source_alias=source_alias,
        source_fingerprint=source_fingerprint,
    )
    if not ret['status']:
        ret = __salt__['docker.create_container'](
            image=image,
            name=role,
            volumes=kwargs.get('volumes', [])
        )
    return ret


def _containers_create_lxc():
    """
    """
    _setup_lxc()
    raise NotImplementedError


def _containers_create_lxd():
    """
    """
    _setup_lxd()
    raise NotImplementedError


def _containers_create_rkt(
        role=None,
        source_alias=None,
        source_fingerprint=None,
        **kwargs
):
    """
    """
    _setup_rkt()
    ret = _containers_create_docker(
        role=role,
        source_alias=source_alias,
        source_fingerprint=source_fingerprint,
        volumes=kwargs.get('volumes', []),
    )
    raise NotImplementedError


def _containers_create_systemd_nspawn():
    """
    """
    _setup_systemd_nspawn()
    raise NotImplementedError


def containers_delete(
        role=None,
        runtime='docker',
        source_os='ubuntu',
        source_release='14.04',
        source_architecture='x86_64',
        source_alias=None,
        source_fingerprint=None,
):
    """
    """
    if runtime == 'docker':
        if not source_alias:
            source_alias = ':'.join((source_os, source_release))
        ret = _containers_delete_docker(
            role=role,
            source_alias=source_alias,
            source_fingerprint=source_fingerprint,
        )
    elif runtime == 'lxc':
        ret = _containers_delete_lxc()
    elif runtime == 'lxd':
        ret = _containers_delete_lxd()
    elif runtime == 'rkt':
        ret = _containers_delete_rkt()
    elif runtime == 'systemd-nspawn':
        ret = _containers_delete_systemd_nspawn()
    else:
        ret = None
    return ret


def _containers_delete_docker(
        role=None,
        source_alias=None,
        source_fingerprint=None,
):
    """
    """
    _setup_docker()
    raise NotImplementedError


def _containers_delete_lxc():
    """
    """
    _setup_lxc()
    raise NotImplementedError


def _containers_delete_lxd():
    """
    """
    _setup_lxd()
    raise NotImplementedError


def _containers_delete_rkt():
    """
    """
    _setup_rkt()
    raise NotImplementedError


def _containers_delete_systemd_nspawn():
    """
    """
    _setup_systemd_nspawn()
    raise NotImplementedError


def containers_list():
    """
    """
    raise NotImplementedError


def containers_state_list(
        role=None,
        runtime='docker',
        source_os='ubuntu',
        source_release='14.04',
        source_architecture='x86_64',
        source_alias=None,
        source_fingerprint=None,
):
    """
    """
    if runtime == 'docker':
        if not source_alias:
            source_alias = ':'.join((source_os, source_release))
        ret = _containers_state_list_docker(
            role=role,
            source_alias=source_alias,
            source_fingerprint=source_fingerprint,
        )
    elif runtime == 'lxc':
        ret = _containers_state_list_lxc()
    elif runtime == 'lxd':
        ret = _containers_state_list_lxd()
    elif runtime == 'rkt':
        ret = _containers_state_list_rkt()
    elif runtime == 'systemd-nspawn':
        ret = _containers_state_list_systemd_nspawn()
    else:
        ret = None
    return ret


def _containers_state_list_docker(
        role=None,
        source_alias=None,
        source_fingerprint=None,
):
    """
    """
    _setup_docker()
    split = source_alias.split(':')
    if source_fingerprint:
        tag = '-'.join(split[:1] + [source_fingerprint])
    else:
        tag = split
    container = ':'.join((role, tag))
    ret = __salt__['docker.inspect_container'](container)
    return ret


def _containers_state_list_lxc():
    """
    """
    _setup_lxc()
    raise NotImplementedError


def _containers_state_list_lxd():
    """
    """
    _setup_lxd()
    raise NotImplementedError


def _containers_state_list_rkt():
    """
    """
    _setup_rkt()
    raise NotImplementedError


def _containers_state_list_systemd_nspawn():
    """
    """
    _setup_systemd_nspawn()
    raise NotImplementedError


def containers_state_update(
        action=None,
        role=None,
        runtime='docker',
        source_os='ubuntu',
        source_release='14.04',
        source_architecture='x86_64',
        source_alias=None,
        source_fingerprint=None,
):
    """
    """
    # TODO: check return type consistency
    if runtime == 'docker':
        if not source_alias:
            source_alias = ':'.join((source_os, source_release))
        ret = _containers_state_update_docker(
            action=action,
            role=role,
            source_alias=source_alias,
            source_fingerprint=source_fingerprint,
        )
    elif runtime == 'lxc':
        ret = _containers_state_update_lxc()
    elif runtime == 'lxd':
        ret = _containers_state_update_lxd()
    elif runtime == 'rkt':
        ret = _containers_state_update_rkt()
    elif runtime == 'systemd-nspawn':
        ret = _containers_state_update_systemd_nspawn()
    else:
        ret = None
    return ret


def _containers_state_update_docker(
        action=None,
        role=None,
        source_alias=None,
        source_fingerprint=None,
        **kwargs
):
    """
    """
    # TODO: ensure return type consistency
    _setup_docker()
    split = source_alias.split(':')
    if source_fingerprint:
        tag = '-'.join(split[:1] + [source_fingerprint])
    else:
        tag = split
    container = ':'.join((role, tag))
    ret = containers_state_list(
        role=role,
        runtime='docker',
        source_alias=source_alias,
        source_fingerprint=source_fingerprint,
    )
    if not ret['status']:
        ret = containers_create(
            role=role,
            runtime='docker',
            source_alias=source_alias,
            source_fingerprint=source_fingerprint,
        )
    if 'action' == 'restart':
        ret = __salt__['docker.restart'](
            container=container,
        )
    elif 'action' == 'start':
        if __salt__['docker.is_running'](container):
            ret = True
        else:
            ret = __salt__['docker.start'](
                container=container,
                binds=lxc_conf_mount_entry(role=role),
                port_bindings=_get_lxc_ns_net_dnats(role=role),
            )
    elif 'action' == 'stop':
        if __salt__['docker.is_running'](container):
            ret = __salt__['docker.stop'](
                container=container,
            )
        else:
            ret = True
    return ret


def _containers_state_update_lxc():
    """
    """
    _setup_lxc()
    raise NotImplementedError


def _containers_state_update_lxd():
    """
    """
    _setup_lxd()
    raise NotImplementedError


def _containers_state_update_rkt():
    """
    """
    _setup_rkt()
    raise NotImplementedError


def _containers_state_update_systemd_nspawn():
    """
    """
    _setup_systemd_nspawn()
    raise NotImplementedError


def exec_():
    """
    """
    raise NotImplementedError


def file_():
    """
    """
    raise NotImplementedError


def move():
    """
    """
    raise NotImplementedError


def images_aliases_list(
        name=None,
        runtime='docker',
):
    """
    """
    if runtime == 'docker':
        ret = _images_aliases_list_docker(
            name=name,
        )
    elif runtime == 'lxc':
        ret = _images_create_lxc()
    elif runtime == 'lxd':
        ret = _images_create_lxd()
    elif runtime == 'rkt':
        ret = _images_create_rkt()
    elif runtime == 'systemd-nspawn':
        ret = _images_create_systemd_nspawn()
    else:
        ret = None
    return ret


def _images_aliases_list_docker(
        name=None,
):
    """
    """
    _setup_docker()
    ret = __salt__['docker.search'](term=name)
    return ret


def _images_aliases_list_lxc():
    """
    """
    _setup_lxc()
    raise NotImplementedError


def _images_aliases_list_lxd():
    """
    """
    _setup_lxd()
    raise NotImplementedError


def _images_aliases_list_rkt():
    """
    """
    _setup_rkt()
    raise NotImplementedError


def _images_aliases_list_systemd_nspawn():
    """
    """
    _setup_systemd_nspawn()
    raise NotImplementedError


def images_create(
        role='salt-minion',
        runtime='docker',
        source_os='ubuntu',
        source_release='14.04',
        source_architecture='x86_64',
        source_alias=None,
        source_fingerprint=None,
):
    """
    """
    if runtime == 'docker':
        if not source_alias:
            source_alias = ':'.join((source_os, source_release))
        ret = _images_create_docker(
            source_alias=source_alias,
            source_fingerprint=source_fingerprint,
            role=role,
            CMD=lxc_start_command(role=role),
            ENV=lxc_conf_environment(role=role),
            EXPOSE=_get_lxc_ns_net_ports(role=role),
            RUN=_get_lxc_create_commands(
                source_alias=source_alias,
                source_fingerprint=source_fingerprint,
                role=role),
        )
    elif runtime == 'lxc':
        ret = _images_create_lxc()
    elif runtime == 'lxd':
        ret = _images_create_lxd()
    elif runtime == 'rkt':
        ret = _images_create_rkt()
    elif runtime == 'systemd-nspawn':
        ret = _images_create_systemd_nspawn()
    else:
        ret = None
    return ret


def _images_create_docker(
        role=None,
        source_alias=None,
        source_fingerprint=None,
        **kwargs
):
    """
    """
    # TODO: check return type consistency
    _setup_docker()
    split = source_alias.split(':')
    if source_fingerprint:
        tag = '-'.join(split[:1] + [source_fingerprint])
    else:
        tag = split
    image = ':'.join((role, tag))
    if source_fingerprint:
        from_ = '@'.join((source_alias, source_fingerprint))
    else:
        from_ = source_alias
    name = source_alias.split(':')[0]
    ret = images_aliases_list(name=name, runtime='docker')
    if any(i.name == name for i in ret.get('out', [])):
        kwargs.update(FROM=from_)
        contents = _manifest_docker(**kwargs)
        dtemp = mkdtemp()
        with open(join(dtemp, 'Dockerfile'), 'w') as f:
            f.write(contents)
        ret = __salt__['docker.build'](dtemp, tag=image)
    else:
        ret = False
    return ret


def _images_create_lxc():
    """
    """
    _setup_lxc()
    raise NotImplementedError


def _images_create_lxd():
    """
    """
    _setup_lxd()
    raise NotImplementedError


def _images_create_rkt():
    """
    """
    _setup_rkt()
    raise NotImplementedError


def _images_create_systemd_nspawn():
    """
    """
    _setup_systemd_nspawn()
    raise NotImplementedError


def images_delete():
    """
    """
    raise NotImplementedError


def remote():
    """
    """
    raise NotImplementedError


def restore():
    """
    """
    raise NotImplementedError


def snapshot():
    """
    """
    raise NotImplementedError


def test():
    """
    """
    # TODO: pass 'salt-call sensu.check' command to create function
    raise NotImplementedError


def _get_defaults(
        role=None
):
    """
    Get default data

    :param str role: Role the image will provide, corresponding to salt state.
    """
    url = 'salt://' + role + '/defaults.yaml'
    defaults = __salt__['cp.get_file_str'](url)
    ret = load(defaults)
    return ret


def _get_lxc(
        role=None
):
    """
    List compute data

    :param str role: Role the image will provide, corresponding to salt state.
    """
    defaults = _get_defaults(role=role)
    ret = defaults.get('lxc', {})
    return ret


def _get_lxc_cgroup(
        role=None
):
    """
    """
    lxc = _get_lxc(role=role)
    ret = lxc.get('cgroup')
    return ret


def _get_lxc_cgroup_blkio(
        role=None
):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('blkio')
    return ret


def _get_lxc_cgroup_cpu(
        role=None
):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('cpu')
    return ret


def _get_lxc_cgroup_cpuacct(
        role=None
):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('cpuacct')
    return ret


def _get_lxc_cgroup_cpuset(
        role=None
):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('cpuset')
    return ret


def _get_lxc_cgroup_devices(
        role=None
):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('devices')
    return ret


def _get_lxc_cgroup_hugetlb(
        role=None
):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('hugetlb')
    return ret


def _get_lxc_cgroup_memory(
        role=None
):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('memory')
    return ret


def _get_lxc_conf(
        role=None
):
    """
    lxc.aa_allow_incomplete
    lxc.aa_profile
    lxc.arch
    lxc.autodev
    lxc.cap.drop
    lxc.cap.keep
    lxc.cgroup.blkio.io_merged
    lxc.cgroup.blkio.io_merged_recursive
    lxc.cgroup.blkio.io_queued
    lxc.cgroup.blkio.io_queued_recursive
    lxc.cgroup.blkio.io_service_bytes
    lxc.cgroup.blkio.io_service_bytes_recursive
    lxc.cgroup.blkio.io_serviced
    lxc.cgroup.blkio.io_serviced_recursive
    lxc.cgroup.blkio.io_service_time
    lxc.cgroup.blkio.io_service_time_recursive
    lxc.cgroup.blkio.io_wait_time
    lxc.cgroup.blkio.io_wait_time_recursive
    lxc.cgroup.blkio.leaf_weight
    lxc.cgroup.blkio.leaf_weight_device
    lxc.cgroup.blkio.reset_stats
    lxc.cgroup.blkio.sectors
    lxc.cgroup.blkio.sectors_recursive
    lxc.cgroup.blkio.throttle.io_service_bytes
    lxc.cgroup.blkio.throttle.io_serviced
    lxc.cgroup.blkio.throttle.read_bps_device
    lxc.cgroup.blkio.throttle.read_iops_device
    lxc.cgroup.blkio.throttle.write_bps_device
    lxc.cgroup.blkio.throttle.write_iops_device
    lxc.cgroup.blkio.time
    lxc.cgroup.blkio.time_recursive
    lxc.cgroup.blkio.weight
    lxc.cgroup.blkio.weight_device
    lxc.cgroup.cpuacct.stat
    lxc.cgroup.cpuacct.usage
    lxc.cgroup.cpuacct.usage_percpu
    lxc.cgroup.cpu.cfs_period_us
    lxc.cgroup.cpu.cfs_quota_us
    lxc.cgroup.cpuset.cpu_exclusive
    lxc.cgroup.cpuset.cpus
    lxc.cgroup.cpuset.mem_exclusive
    lxc.cgroup.cpuset.mem_hardwall
    lxc.cgroup.cpuset.memory_migrate
    lxc.cgroup.cpuset.memory_pressure
    lxc.cgroup.cpuset.memory_pressure_enabled
    lxc.cgroup.cpuset.memory_spread_page
    lxc.cgroup.cpuset.memory_spread_slab
    lxc.cgroup.cpuset.mems
    lxc.cgroup.cpuset.sched_load_balance
    lxc.cgroup.cpuset.sched_relax_domain_level
    lxc.cgroup.cpu.shares
    lxc.cgroup.cpu.stat
    lxc.cgroup.devices.allow
    lxc.cgroup.devices.deny
    lxc.cgroup.devices.list
    lxc.cgroup.hugetlb.2MB.failcnt
    lxc.cgroup.hugetlb.2MB.limit_in_bytes
    lxc.cgroup.hugetlb.2MB.max_usage_in_bytes
    lxc.cgroup.hugetlb.2MB.usage_in_bytes
    lxc.cgroup.memory.failcnt
    lxc.cgroup.memory.force_empty
    lxc.cgroup.memory.kmem.failcnt
    lxc.cgroup.memory.kmem.limit_in_bytes
    lxc.cgroup.memory.kmem.max_usage_in_bytes
    lxc.cgroup.memory.kmem.slabinfo
    lxc.cgroup.memory.kmem.tcp.failcnt
    lxc.cgroup.memory.kmem.tcp.limit_in_bytes
    lxc.cgroup.memory.kmem.tcp.max_usage_in_bytes
    lxc.cgroup.memory.kmem.tcp.usage_in_bytes
    lxc.cgroup.memory.kmem.usage_in_bytes
    lxc.cgroup.memory.limit_in_bytes
    lxc.cgroup.memory.max_usage_in_bytes
    lxc.cgroup.memory.move_charge_at_immigrate
    lxc.cgroup.memory.numa_stat
    lxc.cgroup.memory.oom_control
    lxc.cgroup.memory.pressure_level
    lxc.cgroup.memory.soft_limit_in_bytes
    lxc.cgroup.memory.stat
    lxc.cgroup.memory.swappiness
    lxc.cgroup.memory.usage_in_bytes
    lxc.cgroup.memory.use_hierarchy
    lxc.console
    lxc.console.logfile
    lxc.devttydir
    lxc.environment
    lxc.group
    lxc.haltsignal
    lxc.hook.autodev
    lxc.hook.clone
    lxc.hook.mount
    lxc.hook.post-stop
    lxc.hook.pre-mount
    lxc.hook.pre-start
    lxc.hook.start
    lxc.id_map
    lxc.include
    lxc.kmsg
    lxc.logfile
    lxc.loglevel
    lxc.mount
    lxc.mount.auto
    lxc.mount.entry
    lxc.network.flags
    lxc.network.hwaddr
    lxc.network.ipv4
    lxc.network.ipv4.gateway
    lxc.network.ipv6
    lxc.network.ipv6.gateway
    lxc.network.link
    lxc.network.macvlan.mode
    lxc.network.mtu
    lxc.network.name
    lxc.network.script.down
    lxc.network.script.up
    lxc.network.type
    lxc.network.veth.pair
    lxc.network.vlan.id
    lxc.pts
    lxc.rootfs
    lxc.rootfs.mount
    lxc.rootfs.options
    lxc.seccomp
    lxc.se_context
    lxc.start.auto
    lxc.start.delay
    lxc.start.order
    lxc.stopsignal
    lxc.tty
    lxc.utsname
    """
    lxc = _get_lxc(role=role)
    ret = lxc.get('conf')
    return ret


def _get_lxc_conf_cap(
        role=None
):
    """
    """
    conf = _get_lxc_conf(role=role)
    ret = conf.get('cap')
    return ret


def lxc_conf_environment(
        role=None
):
    """
    """
    ret = ['DEBIAN_FRONTEND noninteractive',
           'bootstrap true',
           'repository https://github.com/khrisrichardson/salt-states.git',
           'ref master',
           'url https://bootstrap.saltstack.com']
    conf = _get_lxc_conf(role=role)
    ret += conf.get('environment')
    return ret


def _get_lxc_conf_hook(
        role=None
):
    """
    """
    conf = _get_lxc_conf(role=role)
    ret = conf.get('hook')
    return ret


def _get_lxc_conf_mount(
        role=None
):
    """
    :param str role: Role the image will provide, corresponding to salt state.
    """
    conf = _get_lxc_conf(role=role)
    ret = conf.get('mount', {})
    return ret


def _get_lxc_conf_mount_entry(
        role=None
):
    """
    :param str role: Role the image will provide, corresponding to salt state.
    """
    mount = _get_lxc_conf_mount(role=role)
    ret = mount.get('entry', [])
    return ret


def lxc_conf_mount_entry(
        role=None
):
    """
    List of device:dir:option to mount in container.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    entry = _get_lxc_conf_mount_entry(role=role)
    ret = [':'.join((e.get('device'),
                     e.get('dir'),
                     e.get('option', 'rw'))) for e in entry]
    return ret


def lxc_conf_mount_entry_dir(
        role=None
):
    """
    List of volumes to mount in container.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    mount = _get_lxc_conf_mount(role=role)
    ret = [e.get('dir') for e in mount]
    return ret


def _get_lxc_create(
        role=None
):
    """
    List network transport data.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    compute = _get_lxc(role=role)
    ret = compute.get('image', {})
    return ret


def lxc_create_source(
        role=None
):
    """
    List of sources from which to create image

    :param str role: Role the image will provide, corresponding to salt state.
    """
    create_ = _get_lxc_create(role=role)
    ret = create_.get('source', [])
    return ret


def _get_lxc_create_commands(
        source_alias=None,
        source_fingerprint=None,
        role=None,
        layer=True,
        unit='low'
):
    """
    List of commands to create image

    :param str role: Role the image will provide, corresponding to salt state.
    :param bool layer: Use low chunks instead of highstate for more granular
      layering.
    """
    ret = []
    # Command to get salt bootstrap script
    cmd = """
          if test -f /usr/bin/python3
          then python3 -c "import urllib.request; urllib.request.urlretrieve('${url}', 'bootstrap-salt.sh')"
          else python  -c "import urllib; print urllib.urlopen('${url}').read()"      > bootstrap-salt.sh
          fi
          """
    # Commands to create salt-minion source image
    ret += [' '.join(cmd.lstrip().replace('\n', ';').split())]
    # ret += ['bash bootstrap-salt.sh -X git 2015.2 || true']
    ret += ['bash bootstrap-salt.sh -X || true']
    ret += ['salt-call file.mkdir  /etc/salt/minion.d --local']
    ret += ['salt-call file.write  /etc/salt/minion.d/salt-master.conf "file_client: local" --local']
    ret += ['salt-call file.append /etc/salt/minion.d/salt-master.conf "fileserver_backend: [roots, git]"']
    ret += ['salt-call file.append /etc/salt/minion.d/salt-master.conf "gitfs_provider: pygit2"']
    ret += ['salt-call file.append /etc/salt/minion.d/salt-master.conf "gitfs_remotes: [\'${repository}\']"']
    ret += ['salt-call file.append /etc/salt/minion.d/salt-master.conf "gitfs_root: salt"']
    ret += ['salt-call file.append /etc/salt/minion.d/salt-master.conf "startup_states: highstate"']
    ret += ['salt-call pkg.install git']
    ret += ['salt-call pkg.install software-properties-common']
    ret += ['salt-call pkg.mod_repo ppa:dennis/python keyserver=hkp://keyserver.ubuntu.com:80 keyid=F3FA6A64F50B4114']
    ret += ['salt-call pkg.install python-pygit2 refresh=True']
    ret += ['salt-call grains.setval environment base']
    ret += ['salt-call saltutil.sync_all']
    # Commands to create salt-minion derived images
    if role == 'salt-minion':
        ret += ['salt-call state.sls salt-minion']
    else:
        if layer:
            if unit == 'low':
                lows = _state_lows(
                    source_alias=source_alias,
                    source_fingerprint=source_fingerprint,
                    role=role)
                for low in lows:
                    ret += ['salt-call state.low "' + low + '"']
            elif unit == 'id':
                ids = _state_ids(
                    source_alias=source_alias,
                    source_fingerprint=source_fingerprint,
                    role=role)
                for (id_, sls) in ids:
                    ret += ['salt-call state.sls_id ' + id_ + ' ' + sls]
        else:
            ret += ['salt-call state.highstate --out-file=/var/log/salt/highstate']
        ret += ['salt-call grains.append roles ' + role]
    # Command to remove salt-minion instance specific data
    ret += ['salt-call cmd.run "rm -rf /etc/salt/minion_id /etc/salt/pki/*/*"']
    return ret


def _get_lxc_ns(
        role=None
):
    """
    :param str role: Role the image will provide, corresponding to salt state.
    """
    lxc = _get_lxc(role=role)
    ret = lxc.get('ns', {})
    return ret


def _get_lxc_ns_net(
        role=None
):
    """
    :param str role: Role the image will provide, corresponding to salt state.
    """
    ns = _get_lxc_ns(role=role)
    ret = ns.get('net', {})
    return ret


def _get_lxc_ns_net_dnats(
        role=None
):
    """
    Dictionary of destination nats to setup in container.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    ret = {}
    net = _get_lxc_ns_net(role=role)
    for data in net:
        port = data.get('port')
        protocol = data.get('protocol', 'tcp')
        key = '/'.join((str(port), protocol))
        dst = data.get('dst')
        dport = data.get('dport')
        if dport:
            if dst:
                if dst == 'anywhere':
                    val = dport
                elif dst == 'bridge':
                    dst = __salt__['network.interface_ip']('docker0')
                    val = (dst, dport)
                else:
                    val = (dst, dport)
            else:
                val = dport
        else:
            continue
        ret[key] = val
    return ret


def _get_lxc_ns_net_ports(
        role=None
):
    """
    List of ports to expose in container.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    net = _get_lxc_ns_net(role=role)
    ret = [str(i.get('port')) + '/' + i.get('protocol', 'tcp') for i in net]
    return ret


def _get_lxc_start(
        role=None
):
    """
    """
    lxc = _get_lxc(role=role)
    ret = lxc.get('start')
    return ret


def lxc_start_command(
        role=None
):
    """
    """
    ret = ['/usr/bin/supervisord',
           '-c',
           '/etc/supervisor/supervisord.conf',
           '-n']
    start_ = _get_lxc_start(role=role)
    ret = start_.get('command') or ret
    return ret


def _manifest_docker(
        **kwargs
):
    """
    """
    ret = ''
    # List of tuples with default values for available Docker instructions
    defaults = [
        ('FROM', 'ubuntu:latest'),
        ('MAINTAINER', 'Khris Richardson <khris.richardson@gmail.com>'),
        ('ADD', []),
        ('COPY', []),
        ('ENV', []),
        ('LABEL', []),
        ('ONBUILD', []),
        ('RUN', []),
        ('USER', None),
        ('VOLUME', []),
        ('WORKDIR', None),
        ('CMD', []),
        ('ENTRYPOINT', []),
        ('EXPOSE', []),
    ]
    # List comprehension of tuples with kwargs values overriding default values
    instructions = [(i[0], kwargs.get(i[0], i[1])) for i in defaults]
    for key, val in instructions:
        if (key in ['CMD', 'ENTRYPOINT'] and val) or isinstance(val, str):
            ret += key + ' ' + str(val).replace("'", '"') + '\n'
        elif isinstance(val, list):
            for i in val:
                ret += key + ' ' + i + '\n'
    return ret


def _manifest_lxc():
    """
    """
    raise NotImplementedError


def _manifest_lxd():
    """
    """
    raise NotImplementedError


def _manifest_rkt():
    """
    """
    raise NotImplementedError


def _manifest_systemd_nspawn():
    """
    """
    raise NotImplementedError


def _state_chunks(
        **kwargs
):
    """
    Function which parses low data and accounts for formatting
    """
    ret = []
    tmp = {}
    text = []
    contents = []
    for (key, val) in list(kwargs.items()):
        if isinstance(val, str) and '\n' in val:
            if key in ['onlyif', 'unless']:
                val = val.replace('\\\n', '')
                val = val.replace('"', ';;;')
                val = val.replace("'", '\"')
                val = val.replace(';;;', "'")
                val = ' '.join(val.split())
                tmp[key] = val
            elif key in ['text']:
                text = val.split('\n')
            elif key in ['contents']:
                contents = val.split('\n')
        else:
            tmp[key] = val
    if text:
        for line in text:
            ret += [dict(list(tmp.items()) + list({'text': line}.items()))]
    if contents:
        tmp.update({'fun': 'append'})
        for line in contents:
            ret += [dict(list(tmp.items()) + list({'contents': line}.items()))]
    else:
        ret += [tmp]
    return ret


def _state_ids(
        source_alias=None,
        source_fingerprint=None,
        role=None
):
    """
    Function which parses lowstate data and returns unique list of sls ids
    """
    lowstate = _state_show_lowstate(
        source_alias=source_alias,
        source_fingerprint=source_fingerprint,
        role=role)
    ret = []
    for low in lowstate:
        if isinstance(low, dict):
            id_ = low.pop('__id__')
            sls = low.pop('__sls__')
            ret += [(id_, sls)]
    return list(OrderedDict.fromkeys(ret))


def _state_lows(
        source_alias=None,
        source_fingerprint=None,
        role=None
):
    """
    Generator which parses lowstate data and yields individual low chunks
    """
    keywords = [
        'order',
        'prereq',
        'prereq_in',
        'require',
        'require_in',
        'watch',
        'watch_in',
        '__id__',
        '__sls__',
        '__env__',
        '__pub_user',
        '__pub_arg',
        '__pub_jid',
        '__pub_fun',
        '__pub_tgt',
        '__pub_ret',
        '__pub_tgt_type',
    ]
    lowstate = _state_show_lowstate(
        source_alias=source_alias,
        source_fingerprint=source_fingerprint,
        role=role)
    for low in lowstate:
        if isinstance(low, dict):
            for chunk in _state_chunks(**low):
                state = chunk.pop('state')
                fun = chunk.pop('fun')
                name = chunk.pop('name')
                for keyword in keywords:
                    chunk.pop(keyword, None)
                chunk = str(pformat(chunk)).replace('\n', '')
                chunk = "{'state': '" + state + "', 'fun': '" + fun + "', 'name': '" + name + "', " + chunk[1:]
                yield chunk


def _state_show_lowstate(
        role=None,
        runtime='docker',
        source_alias=None,
        source_fingerprint=None,
):
    """
    Get lowstate data structure
    """
    if runtime == 'docker':
        ret = _state_show_lowstate_docker(
            role=role,
            source_alias=source_alias,
            source_fingerprint=source_fingerprint,
        )
    elif runtime == 'lxc':
        ret = _state_show_lowstate_lxc()
    elif runtime == 'lxd':
        ret = _state_show_lowstate_lxd()
    elif runtime == 'rkt':
        ret = _state_show_lowstate_rkt()
    elif runtime == 'systemd-nspawn':
        ret = _state_show_lowstate_systemd_nspawn()
    else:
        ret = []
    return ret


def _state_show_lowstate_docker(
        role=None,
        source_alias=None,
        source_fingerprint=None,
):
    """
    Get lowstate data structure via Docker source image
    """
    _setup_docker()
    split = source_alias.split(':')
    if source_fingerprint:
        tag = '-'.join(split[:1] + [source_fingerprint])
    else:
        tag = split
    image = ':'.join(('salt-minion', tag))
    ret = __salt__['docker.inspect_image'](image)
    if not ret['status']:
        images_create(
            role='salt-minion',
            source_alias=source_alias,
            source_fingerprint=source_fingerprint,
        )
    command = "/bin/bash -c '"
    command += "salt-call saltutil.sync_all                &>/dev/null; "
    command += "salt-call grains.append roles " + role + " &>/dev/null; "
    command += "salt-call state.show_lowstate --out yaml   2>/dev/null; "
    command += "'"
    ret = __salt__['docker.create_container'](
        image=image,
        command=command
    )
    cid = ret['id']
    __salt__['docker.start'](cid)
    __salt__['docker.wait'](cid)
    ret = __salt__['docker.logs'](cid)
    __salt__['docker.remove_container'](cid)
    command = 'salt-call state.highstate --out-file=/var/log/salt/highstate'
    return load(ret['out']).get('local', [command])


def _state_show_lowstate_lxc():
    """
    """
    _setup_lxc()
    raise NotImplementedError


def _state_show_lowstate_lxd():
    """
    """
    _setup_lxd()
    raise NotImplementedError


def _state_show_lowstate_rkt():
    """
    """
    _setup_rkt()
    raise NotImplementedError


def _state_show_lowstate_systemd_nspawn():
    """
    """
    _setup_systemd_nspawn()
    raise NotImplementedError


def _setup_docker():
    """
    Ensure node is equipped to manage docker

    :rtype: bool
    """
    if __salt__['cmd.which']('docker') is None:
        ret = __salt__['state.sls']('lxc-docker')
        if not all([i.get('result') is True for i in ret.itervalues()]):
            return False
    if not __salt__['pip.list']('docker-py'):
        ret = __salt__['state.sls']('python-docker')
        if not all([i.get('result') is True for i in ret.itervalues()]):
            return False
    return True


def _setup_lxc():
    """
    Ensure node is equipped to manage lxc

    :rtype: bool
    """
    if __salt__['cmd.which']('lxc') is None:
        ret = __salt__['state.sls']('lxc')
        if not all([i.get('result') is True for i in ret.itervalues()]):
            return False
    return True


def _setup_lxd():
    """
    Ensure node is equipped to manage lxd

    :rtype: bool
    """
    if __salt__['cmd.which']('lxd') is None:
        ret = __salt__['state.sls']('lxd')
        if not all([i.get('result') is True for i in ret.itervalues()]):
            return False
    return True


def _setup_rkt():
    """
    Ensure node is equipped to manage rkt

    :rtype: bool
    """
    if __salt__['cmd.which']('actool') is None:
        ret = __salt__['state.sls']('appc-spec')
        if not all([i.get('result') is True for i in ret.itervalues()]):
            return False
    if __salt__['cmd.which']('docker2aci') is None:
        ret = __salt__['state.sls']('appc-docker2aci')
        if not all([i.get('result') is True for i in ret.itervalues()]):
            return False
    if __salt__['cmd.which']('rkt') is None:
        ret = __salt__['state.sls']('rkt')
        if not all([i.get('result') is True for i in ret.itervalues()]):
            return False
    return True


def _setup_systemd_nspawn():
    """
    Ensure node is equipped to manage systemd-nspawn

    :rtype: bool
    """
    if __salt__['cmd.which']('systemd-nspawn') is None:
        return False
    return True
