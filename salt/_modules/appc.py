# -*- coding: utf-8 -*-
"""
Manage Linux Containers via assorted runtimes

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: linux
"""

# TODO: perform base and role validation
# TODO: add option to create all downstream containers for local testing
# TODO: add option to create individual relations for integration testing
# TODO: add option to execute sensu checks

# import libs: standard
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division
from builtins import open
from builtins import dict
from future import standard_library
standard_library.install_aliases()
from builtins import str
from collections import OrderedDict
from os.path import join
from pprint import pformat
from tempfile import mkdtemp
from yaml import load

RUNTIME = 'docker'


__func_alias__ = {
    'exec_': 'exec',
    'file_': 'file',
    'list_': 'list'
}


def create(base='ubuntu:latest:amd65', role=None, build=True):
    """
    """
    ret = None
    if RUNTIME == 'docker':
        _setup_docker()
        ret = _create_docker(
            base=':'.join(base.split(':')[:2]),
            role=role,
            build=True,
            volumes=lxc_config_mount_entry_dir(role=role),
        )
    elif RUNTIME == 'lxc':
        ret = _create_lxc()
    elif RUNTIME == 'lxd':
        ret = _create_lxd()
    elif RUNTIME == 'nspawn':
        ret = _create_nspawn()
    elif RUNTIME == 'rocket':
        ret = _create_rocket()
    return ret


def _create_docker(base=None, role=None, build=True, **kwargs):
    """
    """
    image = ':'.join((role, '-'.join(base.split(':'))))

    ret = __salt__['docker.inspect_image'](image)
    if not ret['status']:
        publish(base=base, role=role)

    ret = __salt__['docker.inspect_container'](image)
    if not ret['status']:
        ret = __salt__['docker.create_container'](
            image=image,
            name=role,
            volumes=kwargs.get('volumes', [])
        )
    return ret


def _create_lxc():
    """
    """
    raise NotImplementedError


def _create_lxd():
    """
    """
    raise NotImplementedError


def _create_nspawn():
    """
    """
    raise NotImplementedError


def _create_rocket():
    """
    """
    raise NotImplementedError


def delete():
    """
    """
    raise NotImplementedError


def exec_():
    """
    """
    raise NotImplementedError


def file_():
    """
    """
    raise NotImplementedError


def list_():
    """
    """
    raise NotImplementedError


def move():
    """
    """
    raise NotImplementedError


def publish(base='ubuntu:latest:amd64', role='salt-minion'):
    """
    """
    ret = None
    if RUNTIME == 'docker':
        _setup_docker()
        ret = _publish_docker(
            base=':'.join(base.split(':')[:2]),
            role=role,
            CMD=lxc_start_command(role=role),
            ENV=lxc_config_environment(role=role),
            EXPOSE=_get_lxc_ns_net_ports(role=role),
            RUN=_get_lxc_create_commands(base=base, role=role),
        )
    elif RUNTIME == 'lxc':
        ret = _publish_lxc()
    elif RUNTIME == 'lxd':
        ret = _publish_lxd()
    elif RUNTIME == 'nspawn':
        ret = _publish_nspawn()
    elif RUNTIME == 'rocket':
        ret = _publish_rocket()
    return ret


def _publish_docker(base=None, role=None, **kwargs):
    """
    """
    kwargs.update(FROM=base)
    contents = _manifest_docker(**kwargs)
    tag = ':'.join((role, '-'.join(base.split(':'))))
    dtemp = mkdtemp()
    with open(join(dtemp, 'Dockerfile'), 'w') as f:
        f.write(contents)
    ret = __salt__['docker.build'](dtemp, tag=tag)
    return ret


def _publish_lxc():
    """
    """
    raise NotImplementedError


def _publish_lxd():
    """
    """
    raise NotImplementedError


def _publish_nspawn():
    """
    """
    raise NotImplementedError


def _publish_rocket():
    """
    """
    raise NotImplementedError


def remote():
    """
    """
    raise NotImplementedError


def restart():
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


def start(base='ubuntu:latest:amd64', role=None):
    """
    """
    ret = None
    if RUNTIME == 'docker':
        _setup_docker()
        ret = _start_docker(
            base=':'.join(base.split(':')[:2]),
            role=role,
            binds=lxc_config_mount_entry(role=role),
            port_bindings=_get_lxc_ns_net_dnats(role=role),
        )
    elif RUNTIME == 'lxc':
        ret = _start_lxc()
    elif RUNTIME == 'lxd':
        ret = _start_lxd()
    elif RUNTIME == 'nspawn':
        ret = _start_nspawn()
    elif RUNTIME == 'rocket':
        ret = _start_rocket()
    return ret


def _start_docker(base=None, role=None, **kwargs):
    """
    """
    tag = ':'.join((role, '-'.join(base.split(':'))))

    ret = __salt__['docker.inspect_container'](tag)
    if not ret['status']:
        ret = create(base=base, role=role)

    if not __salt__['docker.is_running'](tag):
        ret = __salt__['docker.start'](
            container=role,
            binds=kwargs.get('binds', []),
            port_bindings=kwargs.get('port_bindings', [])
        )
    return ret


def _start_lxc():
    """
    """
    raise NotImplementedError


def _start_lxd():
    """
    """
    raise NotImplementedError


def _start_nspawn():
    """
    """
    raise NotImplementedError


def _start_rocket():
    """
    """
    raise NotImplementedError


def status():
    """
    """
    raise NotImplementedError


def stop():
    """
    """
    raise NotImplementedError


def test():
    """
    """
    # TODO: pass 'salt-call sensu.check' command to create function
    raise NotImplementedError


def _get_defaults(role=None):
    """
    Get default data

    :param str role: Role the image will provide, corresponding to salt state.
    """
    url = 'salt://' + role + '/defaults.yaml'
    defaults = __salt__['cp.get_file_str'](url)
    ret = load(defaults)

    return ret


def _get_lxc(role=None):
    """
    List compute data

    :param str role: Role the image will provide, corresponding to salt state.
    """
    defaults = _get_defaults(role=role)
    ret = defaults.get('lxc', {})

    return ret


def _get_lxc_cgroup(role=None):
    """
    """
    lxc = _get_lxc(role=role)
    ret = lxc.get('cgroup')

    return ret


def _get_lxc_cgroup_blkio(role=None):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('blkio')

    return ret


def _get_lxc_cgroup_cpu(role=None):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('cpu')

    return ret


def _get_lxc_cgroup_cpuacct(role=None):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('cpuacct')

    return ret


def _get_lxc_cgroup_cpuset(role=None):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('cpuset')

    return ret


def _get_lxc_cgroup_devices(role=None):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('devices')

    return ret


def _get_lxc_cgroup_hugetlb(role=None):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('hugetlb')

    return ret


def _get_lxc_cgroup_memory(role=None):
    """
    """
    cgroup = _get_lxc_cgroup(role=role)
    ret = cgroup.get('memory')

    return ret


def _get_lxc_config(role=None):
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
    ret = lxc.get('config')

    return ret


def _get_lxc_config_cap(role=None):
    """
    """
    config = _get_lxc_config(role=role)
    ret = config.get('cap')

    return ret


def lxc_config_environment(role=None):
    """
    """
    ret = ['DEBIAN_FRONTEND noninteractive',
           'bootstrap true',
           'repository https://github.com/khrisrichardson/salt-states.git',
           'ref master',
           'url https://bootstrap.saltstack.com']
    config = _get_lxc_config(role=role)
    ret += config.get('environment')

    return ret


def _get_lxc_config_hook(role=None):
    """
    """
    config = _get_lxc_config(role=role)
    ret = config.get('hook')

    return ret


def _get_lxc_config_mount(role=None):
    """
    :param str role: Role the image will provide, corresponding to salt state.
    """
    config = _get_lxc_config(role=role)
    ret = config.get('mount', {})

    return ret


def _get_lxc_config_mount_entry(role=None):
    """
    :param str role: Role the image will provide, corresponding to salt state.
    """
    mount = _get_lxc_config_mount(role=role)
    ret = mount.get('entry', [])

    return ret


def lxc_config_mount_entry(role=None):
    """
    List of device:dir:option to mount in container.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    entry = _get_lxc_config_mount_entry(role=role)
    ret = [':'.join((e.get('device'),
                     e.get('dir'),
                     e.get('option', 'rw'))) for e in entry]

    return ret


def lxc_config_mount_entry_dir(role=None):
    """
    List of volumes to mount in container.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    mount = _get_lxc_config_mount(role=role)
    ret = [e.get('dir') for e in mount]

    return ret


def _get_lxc_create(role=None):
    """
    List network transport data.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    compute = _get_lxc(role=role)
    ret = compute.get('image', {})

    return ret


def lxc_create_template(role=None):
    """
    List of bases from which to publish image

    :param str role: Role the image will provide, corresponding to salt state.
    """
    create_ = _get_lxc_create(role=role)
    ret = create_.get('template', [])

    return ret


def _get_lxc_create_commands(base=None, role=None, layer=True, unit='low'):
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
    # Commands to create salt-minion base image
    ret += [' '.join(cmd.lstrip().replace('\n', ';').split())]
    ret += ['bash bootstrap-salt.sh -X git 2015.2 || true']
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
                lows = _state_lows(base=base, role=role)
                for low in lows:
                    ret += ['salt-call state.low "' + low + '"']
            elif unit == 'id':
                ids = _state_ids(base=base, role=role)
                for (id_, sls) in ids:
                    ret += ['salt-call state.sls_id ' + id_ + ' ' + sls]
        else:
            ret += ['salt-call state.highstate --out-file=/var/log/salt/highstate']
        ret += ['salt-call grains.append roles ' + role]
    # Command to remove salt-minion instance specific data
    ret += ['salt-call cmd.run "rm -rf /etc/salt/minion_id /etc/salt/pki/*/*"']

    return ret


def _get_lxc_ns(role=None):
    """
    :param str role: Role the image will provide, corresponding to salt state.
    """
    lxc = _get_lxc(role=role)
    ret = lxc.get('ns', {})

    return ret


def _get_lxc_ns_net(role=None):
    """
    :param str role: Role the image will provide, corresponding to salt state.
    """
    ns = _get_lxc_ns(role=role)
    ret = ns.get('net', {})

    return ret


def _get_lxc_ns_net_dnats(role=None):
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


def _get_lxc_ns_net_ports(role=None):
    """
    List of ports to expose in container.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    net = _get_lxc_ns_net(role=role)
    ret = [str(i.get('port')) + '/' + i.get('protocol', 'tcp') for i in net]

    return ret


def _get_lxc_start(role=None):
    """
    """
    lxc = _get_lxc(role=role)
    ret = lxc.get('start')

    return ret


def lxc_start_command(role=None):
    """
    """
    ret = ['/usr/bin/supervisord',
           '-c',
           '/etc/supervisor/supervisord.conf',
           '-n']
    start_ = _get_lxc_start(role=role)
    ret = start_.get('command') or ret

    return ret


def _manifest_docker(**kwargs):
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


def _manifest_nspawn():
    """
    """
    raise NotImplementedError


def _manifest_rocket():
    """
    """
    raise NotImplementedError


def _state_chunks(**kwargs):
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


def _state_ids(base=None, role=None):
    """
    Function which parses lowstate data and returns unique list of sls ids
    """
    lowstate = _state_show_lowstate(base=base, role=role)

    ret = []
    for low in lowstate:
        if isinstance(low, dict):
            id_ = low.pop('__id__')
            sls = low.pop('__sls__')
            ret += [(id_, sls)]
    return list(OrderedDict.fromkeys(ret))


def _state_lows(base=None, role=None):
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
    lowstate = _state_show_lowstate(base=base, role=role)

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


def _state_show_lowstate(base=None, role=None):
    """
    Get lowstate data structure
    """
    ret = None
    if RUNTIME == 'docker':
        _setup_docker()
        ret = _state_show_lowstate_docker(base=base, role=role)
    elif RUNTIME == 'lxc':
        ret = _state_show_lowstate_lxc()
    elif RUNTIME == 'lxd':
        ret = _state_show_lowstate_lxd()
    elif RUNTIME == 'nspawn':
        ret = _state_show_lowstate_nspawn()
    elif RUNTIME == 'rocket':
        ret = _state_show_lowstate_rocket()

    if ret is None:
        return []
    else:
        return ret


def _state_show_lowstate_docker(base=None, role=None):
    """
    Get lowstate data structure via Docker base image
    """
    image = ':'.join(('salt-minion', '-'.join(base.split(':'))))

    ret = __salt__['docker.inspect_image'](image)
    if not ret['status']:
        publish(base=base, role='salt-minion')

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
    raise NotImplementedError


def _state_show_lowstate_lxd():
    """
    """
    raise NotImplementedError


def _state_show_lowstate_nspawn():
    """
    """
    raise NotImplementedError


def _state_show_lowstate_rocket():
    """
    """
    raise NotImplementedError


def _setup_docker():
    """
    """
    if __salt__['cmd.which']('docker') is None:
        __salt__['state.sls']('lxc-docker')
    if not __salt__['pip.list']('docker-py'):
        __salt__['state.sls']('python-docker')


def _setup_lxc():
    """
    """
    if __salt__['cmd.which']('lxc') is None:
        __salt__['state.sls']('lxc')


def _setup_lxd():
    """
    """
    if __salt__['cmd.which']('lxd') is None:
        __salt__['state.sls']('lxd')


def _setup_nspawn():
    """
    """
    raise NotImplementedError


def _setup_rocket():
    """
    """
    if __salt__['cmd.which']('actool') is None:
        __salt__['state.sls']('appc-spec')
    if __salt__['cmd.which']('rkt') is None:
        __salt__['state.sls']('rocket')
