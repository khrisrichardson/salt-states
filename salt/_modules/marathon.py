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
from builtins import dict
from future import standard_library
standard_library.install_aliases()
from json import load
import sys

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


def _get_app(role=None, **kwargs):  # pylint: disable=W0142
    """
    Return Marathon app object
    """
    defaults = {
        'args'              : __salt__['appc.lxc_start_command'](role=role),
        'backoff_factor'    : None,
        'backoff_seconds'   : None,
        'cmd'               : None,
        'constraints'       : None,
        'container'         : _get_app_container(role=role),
        'cpus'              : None,
        'dependencies'      : None,
        'deployments'       : None,
        'disk'              : None,
        'env'               : __salt__['appc.lxc_config_environment'](role=role),
        'executor'          : None,
        'health_checks'     : None,
        'id'                : '/{0}'.format(role),
        'instances'         : None,
        'last_task_failure' : None,
        'mem'               : None,
        'ports'             : None,
        'require_ports'     : None,
        'store_urls'        : None,
        'task_rate_limit'   : None,
        'tasks'             : None,
        'tasks_running'     : None,
        'tasks_staged'      : None,
        'upgrade_strategy'  : None,
        'uris'              : None,
        'user'              : None,
        'version'           : None,
    }
    kwargs = dict((k, kwargs.get(k) or
                      defaults.get(k)) for k in list(defaults.keys()))

    return MarathonApp(**kwargs)  # pylint: disable=W0142


def _get_app_container(role=None, **kwargs):
    """
    """
    if kwargs.get('type') == 'docker':
        _get_app_container_docker(role=role, **kwargs)


def _get_app_container_docker(role=None, **kwargs):
    """
    """
    defaults = {
        'type'         : 'DOCKER',
        'docker'       : {
            'network'    : 'HOST',
            'image'      : 'group/image'
        },
        'portMappings' : [
            {
                'containerPort' : 8080,
                'hostPort'      : 0,
                'servicePort'   : 9000,
                'protocol'      : 'tcp'
            },
            {
                'containerPort' : 161,
                'hostPort'      : 0,
                'protocol'      : 'udp'
            }
        ],
        'volumes'      : [
            {
                'containerPath' : '/etc/a',
                'hostPath'      : '/var/data/a',
                'mode'          : 'RO'
            },
            {
                'containerPath' : '/etc/b',
                'hostPath'      : '/var/data/b',
                'mode'          : 'RW'
            }
        ],
    }
    kwargs = dict((k, kwargs.get(k) or
                      defaults.get(k)) for k in list(defaults.keys()))

    return load(kwargs)


def create_app(app_id, app):
    """
    POST /v2/apps
    """
    args = [
        app_id,
        app
    ]
    _run(*args)  # pylint: disable=W0142


def delete_app(app_id):
    """
    DELETE /v2/apps/{appId}
    """
    args = [
        app_id,
    ]
    _run(*args)  # pylint: disable=W0142


def get_app(app_id):
    """
    GET /v2/apps/{appId}
    """
    args = [
        app_id,
    ]
    _run(*args)  # pylint: disable=W0142


def list_apps(cmd=None, embed_tasks=False, embed_failures=False, **kwargs):
    """
    GET /v2/apps
    """
    kwargs.update({
        'cmd'            : cmd,
        'embed_tasks'    : embed_tasks,
        'embde_failures' : embed_failures,
    })
    _run(**kwargs)  # pylint: disable=W0142


def restart_app(app_id):
    """
    POST /v2/apps/{appId}/restart
    """
    raise NotImplementedError


def rollback_app(app_id, version, force=False):
    """
    PUT /v2/apps/{appId}
    """
    args = [
        app_id,
        version,
    ]
    kwargs = {
        'force': force,
    }
    _run(*args, **kwargs)  # pylint: disable=W0142


def scale_app(app_id, instances=None, delta=None, force=False):
    """
    PUT /v2/apps/{appId}
    """
    args = [
        app_id,
    ]
    kwargs = {
        'instances': instances,
        'delta':     delta,
        'force':     force,
    }
    _run(*args, **kwargs)  # pylint: disable=W0142


def update_app(app_id, app, force=False):
    """
    PUT /v2/apps/{appId}
    """
    args = [
        app_id,
        app,
    ]
    kwargs = {
        'force': force,
    }
    _run(*args, **kwargs)  # pylint: disable=W0142


def create_artifact(artifact_path=None):
    """
    POST /v2/artifacts
    POST /v2/artifacts/{artifactPath}
    """
    raise NotImplementedError


def delete_artifact(artifact_path):
    """
    DELETE /v2/artifacts/{artifactPath}
    """
    raise NotImplementedError


def get_artifact(artifact_path):
    """
    GET /v2/artifacts/{artifactPath}
    """
    raise NotImplementedError


def delete_deployment(deployment_id):
    """
    DELETE /v2/deployments/{deploymentId}
    """
    args = [
        deployment_id,
    ]
    _run(*args)  # pylint: disable=W0142


def list_deployments():
    """
    GET /v2/deployments
    """
    _run()


def create_event_subscription(url):
    """
    POST /v2/eventSubscriptions
    """
    args = [
        url,
    ]
    _run(*args)  # pylint: disable=W0142


def delete_event_subscription(url):
    """
    DELETE /v2/eventSubscriptions
    """
    args = [
        url,
    ]
    _run(*args)  # pylint: disable=W0142


def list_event_subscriptions():
    """
    GET /v2/eventSubscriptions:w
    """
    _run()


def get_info():
    """
    GET /v2/info
    """
    _run()


def _get_group(**kwargs):  # pylint: disable=W0142
    """
    Return Marathon app object
    """
    defaults = {
        'apps'         : None,
        'dependencies' : None,
        'groups'       : None,
        'id'           : None,
        'version'      : None,
    }
    kwargs = dict((k, kwargs.get(k) or
                      defaults.get(k)) for k in list(defaults.keys()))

    return MarathonGroup(**kwargs)  # pylint: disable=W0142


def create_group(group):
    """
    POST /v2/groups
    """
    args = [
        group,
    ]
    _run(*args)  # pylint: disable=W0142


def delete_group(group_id, force=False):
    """
    DELETE /v2/groups/{groupId}
    """
    args = [
        group_id,
    ]
    kwargs = {
        'force': force,
    }
    _run(*args, **kwargs)  # pylint: disable=W0142


def get_group(group_id):
    """
    GET /v2/groups/{groupId}
    """
    args = [
        group_id,
    ]
    _run(*args)  # pylint: disable=W0142


def list_groups(**kwargs):
    """
    GET /v2/groups
    """
    _run(**kwargs)  # pylint: disable=W0142


def rollback_group(group_id, version, force=False):
    """
    PUT /v2/groups/{groupId}/versions/{version}
    """
    args = [
        group_id,
        version,
    ]
    kwargs = {
        'force': force,
    }
    _run(*args, **kwargs)  # pylint: disable=W0142


def scale_group(group_id, scale_by):
    """
    PUT /v2/groups/{groupId}
    """
    args = [
        group_id,
        scale_by,
    ]
    _run(*args)  # pylint: disable=W0142


def update_group(group_id, group, force=False):
    """
    PUT /v2/groups/{groupId}
    """
    args = [
        group_id,
        group,
    ]
    kwargs = {
        'force': force,
    }
    _run(*args, **kwargs)  # pylint: disable=W0142


def help_():
    """
    GET /help
    """
    raise NotImplementedError


def delete_leader():
    """
    DELETE /v2/leader
    """
    raise NotImplementedError


def get_leader():
    """
    GET /v2/leader
    """
    raise NotImplementedError


def logging():
    """
    GET /logging
    """
    raise NotImplementedError


def get_metrics():
    """
    GET /metrics
    """
    _run()


def ping():
    """
    GET /ping
    """
    _run()


def get_queue():
    """
    GET /v2/queue
    """
    raise NotImplementedError


def kill_task(app_id, task_id, scale=False):
    """
    DELETE /v2/apps/{appId}/tasks/{taskId}
    """
    args = [
        app_id,
        task_id,
    ]
    kwargs = {
        'scale': scale,
    }
    _run(*args, **kwargs)  # pylint: disable=W0142


def kill_tasks(app_id, scale=False, host=None, batch_size=0, batch_delay=0):
    """
    DELETE /v2/apps/{appId}/tasks
    """
    args = [
        app_id,
    ]
    kwargs = {
        'batch_delay': batch_delay,
        'batch_size':  batch_size,
        'host':        host,
        'scale':       scale,
    }
    _run(*args, **kwargs)  # pylint: disable=W0142


def list_tasks(app_id=None, **kwargs):
    """
    GET /v2/apps/{appId}/tasks
    GET /v2/tasks
    """
    kwargs.update({
        'app_id': app_id,
    })
    _run(**kwargs)  # pylint: disable=W0142


def get_version(app_id, version):
    """
    GET /v2/apps/{appId}/versions/{version}
    """
    args = [
        app_id,
        version,
    ]
    _run(*args)  # pylint: disable=W0142


def list_versions(app_id):
    """
    GET /v2/apps/{appId}/versions
    """
    args = [
        app_id,
    ]
    _run(*args)  # pylint: disable=W0142


def _run(servers=None,
         username=None,
         password=None,
         timeout=10,
         *args,
         **kwargs):
    """
    Wrapper function for MarathonClient
    """
    func = sys._getframe().f_back.f_code.co_name
    func_args = args
    func_kwargs = kwargs

    kwargs = {
        'servers':  servers  or __salt__['config.option']('marathon.servers'),
        'username': username or __salt__['config.option']('marathon.username'),
        'password': password or __salt__['config.option']('marathon.password'),
        'timeout':  timeout,
    }

    try:
        client = MarathonClient(**kwargs)
        getattr(client, func)(*func_args, **func_kwargs)  # pylint: disable=W0142
    except MarathonError:
        raise
