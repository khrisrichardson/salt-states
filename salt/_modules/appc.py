# -*- coding: utf-8 -*-
"""
Manage containers

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: linux
"""

# TODO: perform base and role validation
# TODO: add option to create all downstream containers
# TODO: add option to create individual relations for integration testing
# TODO: add option to test monitoring scripts

# import libs: standard
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


def create(base='ubuntu:latest:amd64', role=None):
    """
    """
    if RUNTIME == 'docker':
        _setup_docker()
        ret = _create_docker(
            ':'.join(base.split(':')[:2]),
            role,
            volumes=_get_storage_mount_volumes(role=role),
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


def _create_docker(base, role, **kwargs):
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
    if RUNTIME == 'docker':
        _setup_docker()
        ret = _publish_docker(
            ':'.join(base.split(':')[:2]),
            role,
            EXPOSE=_get_network_transport_ports(role=role),
            RUN=_get_compute_image_commands(base=base, role=role),
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


def _publish_docker(base, role, **kwargs):
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
    if RUNTIME == 'docker':
        _setup_docker()
        ret = _start_docker(
            ':'.join(base.split(':')[:2]),
            role,
            binds=_get_storage_mount_details(role=role),
            port_bindings=_get_network_transport_dnats(role=role),
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


def _start_docker(base, role, **kwargs):
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


def _get_compute_image_bases(role=None):
    """
    List of bases from which to publish image

    :param str role: Role the image will provide, corresponding to salt state.
    """
    url = 'salt://' + role + '/defaults.yaml'
    contents = __salt__['cp.get_file_str'](url)
    compute = load(contents).get('compute', {})
    image = compute.get('image', {})
    ret = image.get('bases', [])

    return ret


def _get_compute_image_commands(base=None, role=None, layer=True):
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
    ret += ['bash bootstrap-salt.sh ${args} || true']
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
#           ids = _state_ids(base=base, role=role)
#           for (id_, sls) in ids:
#               ret += ['salt-call state.sls_id ' + id_ + ' ' + sls]
            lows = _state_lows(base=base, role=role)
            for low in lows:
                ret += ['salt-call state.low "' + low + '"']
        else:
            ret += ['salt-call state.highstate --out-file=/var/log/salt/highstate']
        ret += ['salt-call grains.append roles ' + role]
    # Command to remove salt-minion instance specific data
    ret += ['salt-call cmd.run "rm -rf /etc/salt/minion_id /etc/salt/pki/*/*"']

    return ret


def _get_network_transport(role=None):
    """
    List network transport data.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    url = 'salt://' + role + '/defaults.yaml'
    contents = __salt__['cp.get_file_str'](url)
    network = load(contents).get('network', {})
    ret = network.get('transport', {})

    return ret


def _get_network_transport_dnats(role=None):
    """
    Dictionary of destination nats to setup in container.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    ret = {}
    transport = _get_network_transport(role=role)

    for data in transport:
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


def _get_network_transport_ports(role=None):
    """
    List of ports to expose in container.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    transport = _get_network_transport(role=role)
    ret = [str(i.get('port')) + '/' + i.get('protocol', 'tcp') for i in transport]

    return ret


def _get_storage_mounts(role=None):
    """
    Get storage mount data.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    url = 'salt://' + role + '/defaults.yaml'
    contents = __salt__['cp.get_file_str'](url)
    storage = load(contents).get('storage', {})
    ret = storage.get('mounts', [])

    return ret


def _get_storage_mount_details(role=None):
    """
    List of device:dir:option to mount in container.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    mounts = _get_storage_mounts(role=role)
    ret = [':'.join((i.get('device'), i.get('dir'), i.get('option', 'rw'))) for i in mounts]

    return ret


def _get_storage_mount_volumes(role=None):
    """
    List of volumes to mount in container.

    :param str role: Role the image will provide, corresponding to salt state.
    """
    mounts = _get_storage_mounts(role=role)
    ret = [i.get('dir') for i in mounts]

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
        ('ENV', ['DEBIAN_FRONTEND noninteractive',
                 'args -X git 2014.7',
                 'bootstrap true',
                 'repository https://github.com/khrisrichardson/salt-states.git',
                 'ref master',
                 'url https://bootstrap.saltstack.com']),
        ('ONBUILD', []),
        ('RUN', []),
        ('USER', None),
        ('VOLUME', []),
        ('WORKDIR', None),
        ('CMD', ['/usr/bin/supervisord', '-c', '/etc/supervisor/supervisord.conf', '-n']),
        ('ENTRYPOINT', []),
        ('EXPOSE', []),
    ]
    # List comprehension of tuples with kwargs values overriding default values
    instructions = [(i[0], kwargs.get(i[0], i[1])) for i in defaults]

    for key, val in instructions:
        if (key in ['CMD', 'ENTRYPOINT'] and val) or isinstance(val, basestring):
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
    for (key, val) in kwargs.items():
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
            ret += [dict(tmp.items() + {'text': line}.items())]
    if contents:
        tmp.update({'fun': 'append'})
        for line in contents:
            ret += [dict(tmp.items() + {'contents': line}.items())]
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
