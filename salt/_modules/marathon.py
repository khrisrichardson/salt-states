# -*- coding: utf-8 -*-
"""
Manage Mesosphere Marathon

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: all

:depends: - python-marathon

:configuration: In order to connect to Marathon, certain configuration is
    required in /etc/salt/minion on the relevant minions. Some sample configs
    might look like::
        marathon.servers: ['localhost']
        marathon.username: ''
        marathon.password: ''
    This data can also be passed into pillar. Options passed into opts will
    overwrite options passed into pillar.
"""

# https://github.com/thefactory/marathon-python
# https://mesosphere.github.io/marathon/docs/rest-api.html

# import libs: standard
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division
from json import load

try:
    from marathon.client import MarathonClient
    from marathon.exceptions import MarathonError
    from marathon.models.app import MarathonApp
    from marathon.models.group import MarathonGroup

    HAS_LIBS = True
except ImportError:
    HAS_LIBS = False

__func_alias__ = {
    'help_': 'help',
}


def __virtual__():
    """
    Only return if python-marathon is installed
    """
    return 'marathon' if HAS_LIBS else False


def app_create(
        app_id,
        app):
    """
    POST /v2/apps
    """
    func = 'create_app'
    args = [
        app_id,
        app
    ]
    _run(func, *args)  # pylint: disable=W0142


def app_delete(
        app_id):
    """
    DELETE /v2/apps/{appId}
    """
    func = 'delete_app'
    args = [
        app_id,
    ]
    _run(func, *args)  # pylint: disable=W0142


def app_get(
        app_id):
    """
    GET /v2/apps/{appId}
    """
    func = 'get_app'
    args = [
        app_id,
    ]
    _run(func, *args)  # pylint: disable=W0142


def app_list(
        cmd=None,
        embed_failures=False,
        embed_tasks=False,
        **kwargs):
    """
    GET /v2/apps
    """
    func = 'list_apps'
    kwargs.update({
        'cmd': cmd,
        'embed_tasks': embed_tasks,
        'embde_failures': embed_failures,
    })
    _run(func, **kwargs)  # pylint: disable=W0142


def app_restart(
        app_id):
    """
    POST /v2/apps/{appId}/restart
    """
    func = 'restart_app'
    raise NotImplementedError


def app_rollback(
        app_id,
        version,
        force=False):
    """
    PUT /v2/apps/{appId}
    """
    func = 'rollback_app'
    args = [
        app_id,
        version,
    ]
    kwargs = {
        'force': force,
    }
    _run(func, *args, **kwargs)  # pylint: disable=W0142


def app_scale(
        app_id,
        instances=None,
        delta=None,
        force=False):
    """
    PUT /v2/apps/{appId}
    """
    func = 'scale_app'
    args = [
        app_id,
    ]
    kwargs = {
        'instances': instances,
        'delta': delta,
        'force': force,
    }
    _run(func, *args, **kwargs)  # pylint: disable=W0142


def app_update(
        app_id,
        app,
        force=False):
    """
    PUT /v2/apps/{appId}
    """
    func = 'update_app'
    args = [
        app_id,
        app,
    ]
    kwargs = {
        'force': force,
    }
    _run(func, *args, **kwargs)  # pylint: disable=W0142


def _app_get(
        role=None,
        **kwargs):  # pylint: disable=W0142
    """
    Return Marathon app object
    """
    defaults = {
        'args': __salt__['appc.lxc_start_command'](role=role),
        'backoff_factor': None,
        'backoff_seconds': None,
        'cmd': None,
        'constraints': None,
        'container': _app_container_get(role=role, type='docker'),
        'cpus': None,
        'dependencies': None,
        'deployments': None,
        'disk': None,
        'env': __salt__['appc.lxc_config_environment'](role=role),
        'executor': None,
        'health_checks': None,
        'id': '/{0}'.format(role),
        'instances': None,
        'last_task_failure': None,
        'mem': None,
        'ports': None,
        'require_ports': None,
        'store_urls': None,
        'task_rate_limit': None,
        'tasks': None,
        'tasks_running': None,
        'tasks_staged': None,
        'upgrade_strategy': None,
        'uris': None,
        'user': None,
        'version': None,
    }
    kwargs = dict((k, kwargs.get(k) or
                   defaults.get(k)) for k in defaults)

    return MarathonApp(**kwargs)  # pylint: disable=W0142


def _app_container_get(
        role=None,
        **kwargs):
    """
    """
    if kwargs.get('type') == 'docker':
        _app_container_get_docker(role=role, **kwargs)


def _app_container_get_docker(
        role=None,
        **kwargs):
    """
    """
    defaults = {
        'type': 'DOCKER',
        'docker': {
            'network': 'HOST',
            'image': 'group/image'
        },
        'portMappings': [
            {
                'containerPort': 8080,
                'hostPort': 0,
                'servicePort': 9000,
                'protocol': 'tcp'
            },
            {
                'containerPort': 161,
                'hostPort': 0,
                'protocol': 'udp'
            }
        ],
        'volumes': [
            {
                'containerPath': '/etc/a',
                'hostPath': '/var/data/a',
                'mode': 'RO'
            },
            {
                'containerPath': '/etc/b',
                'hostPath': '/var/data/b',
                'mode': 'RW'
            }
        ],
    }
    kwargs = dict((k, kwargs.get(k) or
                   defaults.get(k)) for k in defaults)

    return load(kwargs)


def artifact_create(
        artifact_path=None):
    """
    POST /v2/artifacts
    POST /v2/artifacts/{artifactPath}
    """
    func = 'create_artifact'
    raise NotImplementedError


def artifact_delete(
        artifact_path):
    """
    DELETE /v2/artifacts/{artifactPath}
    """
    func = 'delete_artifact'
    raise NotImplementedError


def artifact_get(
        artifact_path):
    """
    GET /v2/artifacts/{artifactPath}
    """
    func = 'get_artifact'
    raise NotImplementedError


def deployment_delete(
        deployment_id):
    """
    DELETE /v2/deployments/{deploymentId}
    """
    func = 'delete_deployment'
    args = [
        deployment_id,
    ]
    _run(func, *args)  # pylint: disable=W0142


def deployment_list():
    """
    GET /v2/deployments
    """
    func = 'list_deployments'
    _run(func)


def event_subscription_create(
        url):
    """
    POST /v2/eventSubscriptions
    """
    func = 'create_event_subscription'
    args = [
        url,
    ]
    _run(func, *args)  # pylint: disable=W0142


def event_subscription_delete(
        url):
    """
    DELETE /v2/eventSubscriptions
    """
    func = 'delete_event_subscription'
    args = [
        url,
    ]
    _run(func, *args)  # pylint: disable=W0142


def event_subscription_list():
    """
    GET /v2/eventSubscriptions
    """
    func = 'list_event_subscriptions'
    _run(func)


def info_get():
    """
    GET /v2/info
    """
    func = 'get_info'
    _run(func)


def group_create(
        group):
    """
    POST /v2/groups
    """
    func = 'create_group'
    args = [
        group,
    ]
    _run(func, *args)  # pylint: disable=W0142


def group_delete(
        group_id,
        force=False):
    """
    DELETE /v2/groups/{groupId}
    """
    func = 'delete_group'
    args = [
        group_id,
    ]
    kwargs = {
        'force': force,
    }
    _run(func, *args, **kwargs)  # pylint: disable=W0142


def group_get(
        group_id):
    """
    GET /v2/groups/{groupId}
    """
    func = 'get_group'
    args = [
        group_id,
    ]
    _run(func, *args)  # pylint: disable=W0142


def group_list(
        **kwargs):
    """
    GET /v2/groups
    """
    func = 'list_groups'
    _run(func, **kwargs)  # pylint: disable=W0142


def group_rollback(
        group_id,
        version,
        force=False):
    """
    PUT /v2/groups/{groupId}/versions/{version}
    """
    func = 'rollback_group'
    args = [
        group_id,
        version,
    ]
    kwargs = {
        'force': force,
    }
    _run(func, *args, **kwargs)  # pylint: disable=W0142


def group_scale(
        group_id,
        scale_by):
    """
    PUT /v2/groups/{groupId}
    """
    func = 'scale_group'
    args = [
        group_id,
        scale_by,
    ]
    _run(func, *args)  # pylint: disable=W0142


def group_update(
        group_id,
        group,
        force=False):
    """
    PUT /v2/groups/{groupId}
    """
    func = 'update_group'
    args = [
        group_id,
        group,
    ]
    kwargs = {
        'force': force,
    }
    _run(func, *args, **kwargs)  # pylint: disable=W0142


def _group_get(
        **kwargs):  # pylint: disable=W0142
    """
    Return Marathon app object
    """
    defaults = {
        'apps': None,
        'dependencies': None,
        'groups': None,
        'id': None,
        'version': None,
    }
    kwargs = dict((k, kwargs.get(k) or
                   defaults.get(k)) for k in defaults)

    return MarathonGroup(**kwargs)  # pylint: disable=W0142


def help_():
    """
    GET /help
    """
    func = 'help'
    raise NotImplementedError


def leader_delete():
    """
    DELETE /v2/leader
    """
    func = 'delete_leader'
    raise NotImplementedError


def leader_get():
    """
    GET /v2/leader
    """
    func = 'leader_get'
    raise NotImplementedError


def logging():
    """
    GET /logging
    """
    func = 'logging'
    raise NotImplementedError


def metrics_get():
    """
    GET /metrics
    """
    func = 'get_metrics'
    _run(func)


def ping():
    """
    GET /ping
    """
    func = 'ping'
    _run(func)


def queue_get():
    """
    GET /v2/queue
    """
    func = 'get_queue'
    raise NotImplementedError


def task_kill(
        app_id,
        batch_delay=0,
        batch_size=0,
        host=None,
        scale=False,
        task_id=None):
    """
    DELETE /v2/apps/{appId}/tasks
    DELETE /v2/apps/{appId}/tasks/{taskId}
    """
    if task_id:
        func = 'kill_task'
        args = [
            app_id,
            task_id,
        ]
        kwargs = {
            'scale': scale,
        }
        _run(func, *args, **kwargs)  # pylint: disable=W0142
    else:
        func = 'kill_tasks'
        args = [
            app_id,
        ]
        kwargs = {
            'batch_delay': batch_delay,
            'batch_size': batch_size,
            'host': host,
            'scale': scale,
        }
        _run(func, *args, **kwargs)  # pylint: disable=W0142


def task_list(
        app_id=None,
        **kwargs):
    """
    GET /v2/apps/{appId}/tasks
    GET /v2/tasks
    """
    func = 'list_tasks'
    kwargs.update({
        'app_id': app_id,
    })
    _run(func, **kwargs)  # pylint: disable=W0142


def version_get(
        app_id,
        version):
    """
    GET /v2/apps/{appId}/versions/{version}
    """
    func = 'get_version'
    args = [
        app_id,
        version,
    ]
    _run(func, *args)  # pylint: disable=W0142


def version_list(
        app_id):
    """
    GET /v2/apps/{appId}/versions
    """
    func = 'list_versions'
    args = [
        app_id,
    ]
    _run(func, *args)  # pylint: disable=W0142


def _run(
        func,
        servers=None,
        username=None,
        password=None,
        timeout=10,
        *args,
        **kwargs):
    """
    Wrapper function for MarathonClient
    """
    func_args = args
    func_kwargs = kwargs

    kwargs = {
        'servers': servers or __salt__['config.option']('marathon.servers'),
        'username': username or __salt__['config.option']('marathon.username'),
        'password': password or __salt__['config.option']('marathon.password'),
        'timeout': timeout,
    }

    try:
        client = MarathonClient(**kwargs)
        getattr(client, func)(*func_args, **func_kwargs)  # pylint: disable=W0142
    except MarathonError:
        raise
