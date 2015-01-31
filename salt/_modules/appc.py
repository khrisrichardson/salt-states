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
from textwrap import dedent
from yaml import load

RUNTIME = 'docker'


__func_alias__ = {
    'exec_': 'exec',
    'list_': 'list'
}


def create(base='ubuntu:latest:amd64', role=None):
    """
    """
    if RUNTIME == 'docker':
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


def _create_lxc(base, role, **kwargs):
    """
    """


def _create_lxd(base, role, **kwargs):
    """
    """


def _create_nspawn(base, role, **kwargs):
    """
    """


def _create_rocket(base, role, **kwargs):
    """
    """


def delete():
    """
    """


def exec_():
    """
    """


def file():
    """
    """


def list_():
    """
    """


def move():
    """
    """


def publish(base='ubuntu:latest:amd64', role='salt-minion'):
    """
    """
    if RUNTIME == 'docker':
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
    f = open(join(dtemp, 'Dockerfile'), 'w')
    f.write(contents)
    f.close()
    ret = __salt__['docker.build'](dtemp, tag=tag)
    return ret


def _publish_lxc(base, role, **kwargs):
    """
    """


def _publish_lxd(base, role, **kwargs):
    """
    """


def _publish_nspawn(base, role, **kwargs):
    """
    """


def _publish_rocket(base, role, **kwargs):
    """
    """


def remote():
    """
    """


def restart():
    """
    """


def restore():
    """
    """


def snapshot():
    """
    """


def start(base='ubuntu:latest:amd64', role=None):
    """
    """
    if RUNTIME == 'docker':
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

    print ret

    if not __salt__['docker.is_running'](tag):
        ret = __salt__['docker.start'](
            container=role,
            binds=kwargs.get('binds', []),
            port_bindings=kwargs.get('port_bindings', [])
        )
    return ret


def _start_lxc(base, role, **kwargs):
    """
    """


def _start_lxd(base, role, **kwargs):
    """
    """


def _start_nspawn(base, role, **kwargs):
    """
    """


def _start_rocket(base, role, **kwargs):
    """
    """


def status():
    """
    """


def stop():
    """
    """


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
    ret += ['salt-call file.append /etc/salt/minion.d/salt-master.conf "fileserver_backend: [git]"']
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
    if role != 'salt-minion':
        ret += ['salt-call grains.append roles ' + role]
        if layer:
            ids = _state_ids(base=base, role=role)
            for (id_, sls) in ids:
                ret += ['salt-call state.sls_id ' + id_ + ' ' + sls]
#           lows = _state_lows(base=base, role=role)
#           for low in lows:
#               ret += ['salt-call state.low "' + low + '"']
        else:
            ret += ['salt-call state.highstate --out-file=/var/log/salt/highstate']
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
        k = '/'.join((str(port), protocol))
        dst = data.get('dst')
        dport = data.get('dport')
        if dport:
            if dst:
                if dst == 'anywhere':
                    v = dport
                elif dst == 'bridge':
                    dst = __salt__['network.interface_ip']('docker0')
                    v = (dst, dport)
                else:
                    v = (dst, dport)
            else:
                v = dport
        else:
            continue
        ret[k] = v

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
                 'args -X git v2014.7.1',
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

    for k, v in instructions:
        if (k in ['CMD', 'ENTRYPOINT'] and v) or isinstance(v, basestring):
            ret += k + ' ' + str(v).replace("'", '"') + '\n'
        elif isinstance(v, list):
            for i in v:
                ret += k + ' ' + i + '\n'

    return ret


def _manifest_lxc(**kwargs):
    """
    """


def _manifest_lxd(**kwargs):
    """
    """


def _manifest_nspawn(**kwargs):
    """
    """


def _manifest_rocket(**kwargs):
    """
    """


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
            ret += (id_, sls)
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
            state = low.pop('state')
            fun = low.pop('fun')
            name = low.pop('name')
            for keyword in keywords:
                low.pop(keyword, None)
            low = str(pformat(low)).replace('\n', '')
            low = "{'state': '" + state + "', 'fun': '" + fun + "', 'name': '" + name + "', " + low[1:]
            yield low


def _state_show_lowstate(base=None, role=None):
    """
    Get lowstate data structure
    """
    if RUNTIME == 'docker':
        ret = _state_show_lowstate_docker(base=base, role=role)
    elif RUNTIME == 'lxc':
        ret = _state_show_lowstate_lxc(base=base, role=role)
    elif RUNTIME == 'lxd':
        ret = _state_show_lowstate_lxd(base=base, role=role)
    elif RUNTIME == 'nspawn':
        ret = _state_show_lowstate_nspawn(base=base, role=role)
    elif RUNTIME == 'rocket':
        ret = _state_show_lowstate_rocket(base=base, role=role)

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

    return load(ret['out']).get('local', ['salt-call state.highstate --out-file=/var/log/salt/highstate'])
