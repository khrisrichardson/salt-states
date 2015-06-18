# -*- coding: utf-8 -*-
"""
Manage Apache Aurora

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: linux
"""

# import libs: standard
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division

# import libs: salt
from salt.utils import which


def __virtual__():
    """
    Only return if ivy is installed
    """
    return 'aurora' if which('aurora') else False


def beta_update_abort(
        cluster,
        role,
        env,
        name,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def beta_update_list(
        cluster,
        job=None,
        role=None,
        skip_hooks=None,
        status=None,
        user=None,
        verbose=False,
        write_json=False):
    """

    :return:
    """
    raise NotImplementedError


def beta_update_pause(
        cluster,
        role,
        env,
        name,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def beta_update_resume(
        cluster,
        role,
        env,
        name,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def beta_update_start(
        cluster,
        role,
        env,
        name,
        pathname,
        bind=None,
        healthcheck_interval_seconds=None,
        instances=None,
        open_browser=False,
        read_json=False,
        skip_hooks=None,
        strict=False,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def beta_update_status(
        cluster,
        role,
        env,
        name,
        skip_hooks=None,
        verbose=False,
        write_json=False):
    """

    :return:
    """
    raise NotImplementedError


def config_list(
        pathname,
        bind=None,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def cron_deschedule(
        cluster,
        role,
        env,
        name,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def cron_schedule(
        cluster,
        role,
        env,
        name,
        pathname,
        bind=None,
        read_json=False,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def cron_show(
        cluster,
        role,
        env,
        name,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def cron_start(
        cluster,
        role,
        env,
        name,
        bind=None,
        config=None,
        open_browser=False,
        read_json=False,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def job_cancel_update(
        cluster,
        role,
        env,
        name,
        config=None,
        read_json=False,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def job_create(
        cluster,
        role,
        env,
        name,
        pathname,
        bind=None,
        open_browser=False,
        read_json=False,
        skip_hooks=None,
        verbose=False,
        wait_until=None):
    """

    :return:
    """
    raise NotImplementedError


def job_diff(
        cluster,
        role,
        env,
        name,
        pathname,
        bind=None,
        from_cluster=None,
        read_json=False,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def job_inspect(
        cluster,
        role,
        env,
        name,
        pathname,
        bind=None,
        local=False,
        raw=False,
        read_json=False,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def job_kill(
        cluster,
        role,
        env,
        name,
        batch_size=None,
        config=None,
        instances=None,
        max_total_failures=None,
        no_batching=False,
        open_browser=False,
        skip_hooks=None,
        strict=False,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def job_killall(
        cluster,
        role,
        env,
        name,
        batch_size=None,
        config=None,
        max_total_failures=None,
        no_batching=False,
        open_browser=False,
        skip_hooks=None,
        strict=False,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def job_list(
        cluster,
        env=None,
        name=None,
        role=None,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def job_open(
        cluster,
        env=None,
        job=None,
        role=None,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def job_restart(
        cluster,
        role,
        env,
        name,
        batch_size=None,
        bind=None,
        config=None,
        healthcheck_interval_seconds=None,
        instances=None,
        force=False,
        max_per_instance_failures=None,
        max_total_failures=None,
        open_browser=False,
        read_json=False,
        restart_threshold=None,
        skip_hooks=None,
        strict=False,
        verbose=False,
        watch_secs=None):
    """

    :return:
    """
    raise NotImplementedError


def job_status(
        cluster,
        env=None,
        name=None,
        role=None,
        skip_hooks=None,
        verbose=False,
        write_json=False):
    """

    :return:
    """
    raise NotImplementedError


def job_update(
        cluster,
        role,
        env,
        name,
        pathname,
        bind=None,
        force=False,
        healthcheck_interval_seconds=None,
        instances=None,
        read_json=False,
        skip_hooks=None,
        strict=False,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def quota_get(
        cluster,
        name,
        skip_hooks=None,
        verbose=False,
        write_json=False):
    """

    :return:
    """
    raise NotImplementedError


def sla_get_job_uptime(
        cluster,
        role,
        env,
        name,
        percentiles=None,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def sla_get_task_up_count(
        cluster,
        role,
        env,
        name,
        durations=None,
        skip_hooks=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def task_run(
        cluster,
        role,
        env,
        name,
        unix_command_line,
        executor_sandbox=None,
        instances=None,
        ssh_user=None,
        skip_hooks=None,
        threads=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError


def task_ssh(
        cluster,
        role,
        env,
        name,
        instance,
        command=None,
        executor_sandbox=None,
        ssh_user=None,
        skip_hooks=None,
        tunnels=None,
        verbose=False):
    """

    :return:
    """
    raise NotImplementedError
