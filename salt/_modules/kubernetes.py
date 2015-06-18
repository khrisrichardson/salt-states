# -*- coding: utf-8 -*-
"""
Manage Google Kubernetes

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: linux
"""

# http://kubernetes.io/third_party/swagger-ui/

# import libs: standard
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division
from json import loads

# import libs: salt
from salt.utils.http import query


def api():
    """
    Get available API versions

    GET /api

    :return:
    """
    args = [
        '/api'
    ]
    kwargs = {
        'method': 'GET'
    }
    return query(*args, **kwargs)


def bindings_create(
        name=None,
        namespaces=None,
):
    """
    Create a Binding

    POST /api/v1beta3/namespaces/{namespaces}/bindings
    POST /api/v1beta3/namespaces/{namespaces}/pods/{name}/binding

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "target": {
            "apiVersion": "",
            "fieldPath": "",
            "kind": "",
            "name": "",
            "namespace": "",
            "resourceVersion": "",
            "uid": ""
        },
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'bindings',
        'name': name,
        'namespaces': namespaces,
    }
    return _create(**kwargs)


def endpoints_create(
        namespaces=None,
):
    """
    Create a Endpoints

    POST /api/v1beta3/namespaces/{namespaces}/endpoints

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "subsets": [
            {
                "addresses": [
                    {
                        "IP": "",
                        "targetRef": {
                            "apiVersion": "",
                            "fieldPath": "",
                            "kind": "",
                            "name": "",
                            "namespace": "",
                            "resourceVersion": "",
                            "uid": ""
                        }
                    }
                ],
                "ports": [
                    {
                        "name": "",
                        "port": 0,
                        "protocol": ""
                    }
                ]
            }
        ],
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'endpoints',
        'namespaces': namespaces,
    }
    return _create(**kwargs)


def endpoints_list(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    list of watch objects of kind Endpoints

    GET /api/v1beta3/endpoints
    GET /api/v1beta3/namespaces/{namespaces}/endpoints
    GET /api/v1beta3/namespaces/{namespaces}/endpoints/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'endpoints',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def endpoints_patch(
        body='',
        name=None,
        namespaces=None,
):
    """
    partially update the specified Endpoints

    PATCH /api/v1beta3/namespaces/{namespaces}/endpoints/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'endpoints',
        'name': name,
        'namespaces': namespaces,
    }
    return _patch(**kwargs)


def endpoints_replace(
        name=None,
        namespaces=None,
):
    """
    replace the specified Endpoints

    PUT /api/v1beta3/namespaces/{namespaces}/endpoints/{name}

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "subsets": [
            {
                "addresses": [
                    {
                        "IP": "",
                        "targetRef": {
                            "apiVersion": "",
                            "fieldPath": "",
                            "kind": "",
                            "name": "",
                            "namespace": "",
                            "resourceVersion": "",
                            "uid": ""
                        }
                    }
                ],
                "ports": [
                    {
                        "name": "",
                        "port": 0,
                        "protocol": ""
                    }
                ]
            }
        ],
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'endpoints',
        'name': name,
        'namespaces': namespaces,
    }
    return _replace(**kwargs)


def endpoints_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    Watch a list of Endpoints

    GET /api/v1beta3/watch/endpoints
    GET /api/v1beta3/watch/namespaces/{namespaces}/endpoints
    GET /api/v1beta3/watch/namespaces/{namespaces}/endpoints/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'endpoints',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def events_create(
        namespaces=None,
):
    """
    POST /api/v1beta3/namespaces/{namespaces}/events create a Event

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "count": 0,
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "firstTimestamp": "",
        "generateName": "",
        "involvedObject": {
            "apiVersion": "",
            "fieldPath": "",
            "kind": "",
            "name": "",
            "namespace": "",
            "resourceVersion": "",
            "uid": ""
        },
        "kind": "",
        "labels": "any",
        "lastTimestamp": "",
        "message": "",
        "name": "",
        "namespace": "",
        "reason": "",
        "resourceVersion": "",
        "selfLink": "",
        "source": {
            "component": "",
            "host": ""
        },
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'events',
        'namespaces': namespaces,
    }
    return _create(**kwargs)


def events_delete(
        name=None,
        namespaces=None,
):
    """
    Delete an Event

    DELETE /api/v1beta3/namespaces/{namespaces}/events/{name}

    :return:
    """
    kwargs = {
        'kind': 'events',
        'name': name,
        'namespaces': namespaces,
    }
    return _delete(**kwargs)


def events_list(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    list of watch objects of kind Event

    GET /api/v1beta3/events
    GET /api/v1beta3/namespaces/{namespaces}/events
    GET /api/v1beta3/namespaces/{namespaces}/events/{name} read the specified Event

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'events',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def events_patch(
        body='',
        name=None,
        namespaces=None,
):
    """
    partially update the specified Event

    PATCH /api/v1beta3/namespaces/{namespaces}/events/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'events',
        'name': name,
        'namespaces': namespaces,
    }
    return _patch(**kwargs)


def events_replace(
        name=None,
        namespaces=None,
):
    """
    replace the specified Event

    PUT /api/v1beta3/namespaces/{namespaces}/events/{name}

    :return:
    """
    body = {
        'annotations': 'v1beta3.ObjectMeta.annotations',
        'apiVersion': '',
        'count': 0,
        'creationTimestamp': '',
        'firstTimestamp': '',
        'generateName': '',
        'involvedObject': {
            'apiVersion': '',
            'fieldPath': '',
            'kind': '',
            'name': '',
            'namespace': '',
            'resourceVersion': '',
            'uid': 'types.UID'
        },
        'kind': '',
        'labels': 'v1beta3.ObjectMeta.labels',
        'lastTimestamp': '',
        'message': '',
        'name': '',
        'namespace': '',
        'reason': '',
        'resourceVersion': '',
        'selfLink': '',
        'source': {
            'component': '',
            'host': ''
        },
        'uid': 'types.UID'
    }
    kwargs = {
        'body': body,
        'kind': 'events',
        'name': name,
        'namespaces': namespaces,
    }
    return _replace(**kwargs)


def events_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    Watch a list of Event

    GET /api/v1beta3/watch/events
    GET /api/v1beta3/watch/namespaces/{namespaces}/events
    GET /api/v1beta3/watch/namespaces/{namespaces}/events/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'events',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def limitranges_create(
        namespaces=None,
):
    """
    Create a LimitRange

    POST /api/v1beta3/namespaces/{namespaces}/limitranges

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "spec": {
            "limits": [
                {
                    "default": "any",
                    "max": "any",
                    "min": "any",
                    "type": ""
                }
            ]
        },
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'limitranges',
        'namespaces': namespaces,
    }
    return _create(**kwargs)


def limitranges_delete(
        name=None,
        namespaces=None,
):
    """
    Delete a LimitRange

    DELETE /api/v1beta3/namespaces/{namespaces}/limitranges/{name}

    :return:
    """
    kwargs = {
        'kind': 'limitranges',
        'name': name,
        'namespaces': namespaces,
    }
    return _delete(**kwargs)


def limitranges_list(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    list of watch objects of kind LimitRange

    GET /api/v1beta3/limitranges
    GET /api/v1beta3/namespaces/{namespaces}/limitranges
    GET /api/v1beta3/namespaces/{namespaces}/limitranges/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'limitranges',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def limitranges_patch(
        body='',
        name=None,
        namespaces=None,
):
    """
    partially update the specified LimitRange

    PATCH /api/v1beta3/namespaces/{namespaces}/limitranges/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'limitranges',
        'name': name,
        'namespaces': namespaces,
    }
    return _patch(**kwargs)


def limitranges_replace(
        name=None,
        namespaces=None,
):
    """
    replace the specified LimitRange

    PUT /api/v1beta3/namespaces/{namespaces}/limitranges/{name}

    :return:
    """
    body = {
        'annotations': 'v1beta3.ObjectMeta.annotations',
        'apiVersion': '',
        'creationTimestamp': '',
        'generateName': '',
        'kind': '',
        'labels': 'v1beta3.ObjectMeta.labels',
        'name': '',
        'namespace': '',
        'resourceVersion': '',
        'selfLink': '',
        'spec': {
            'limits': [
                None
            ]
        },
        'uid': 'types.UID'
    }
    kwargs = {
        'body': body,
        'kind': 'limitranges',
        'name': name,
        'namespaces': namespaces,
    }
    return _replace(**kwargs)


def limitranges_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    Watch a list of LimitRange

    GET /api/v1beta3/watch/limitranges
    GET /api/v1beta3/watch/namespaces/{namespaces}/limitranges
    GET /api/v1beta3/watch/namespaces/{namespaces}/limitranges/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'limitranges',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def namespaces_create():
    """
    Create a Namespace

    POST /api/v1beta3/namespaces

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "spec": {
            "finalizers": [
                {}
            ]
        },
        "status": {
            "phase": ""
        },
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'namespaces',
    }
    return _create(**kwargs)


def namespaces_delete(
        name=None,
):
    """
    Delete a Namespace

    DELETE /api/v1beta3/namespaces/{name}

    :return:
    """
    kwargs = {
        'kind': 'namespaces',
        'name': name,
    }
    return _delete(**kwargs)


def namespaces_list(
        field_selector=None,
        label_selector=None,
        name=None,
        resource_version=None,
        watch=False,
):
    """
    list of watch objects of kind Namespace

    GET /api/v1beta3/namespaces
    GET /api/v1beta3/namespaces/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'namespaces',
        'label_selector': label_selector,
        'name': name,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def namespaces_patch(
        body='',
        name=None,
):
    """
    partially update the specified Namespace

    PATCH /api/v1beta3/namespaces/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'services',
        'name': name,
    }
    return _patch(**kwargs)


def namespaces_replace(
        name=None,
):
    """
    replace the specified Namespace

    PUT /api/v1beta3/namespaces/{name}

    :return:
    """
    body = {
        'annotations': 'v1beta3.ObjectMeta.annotations',
        'apiVersion': '',
        'creationTimestamp': '',
        'generateName': '',
        'kind': '',
        'labels': 'v1beta3.ObjectMeta.labels',
        'name': '',
        'namespace': '',
        'resourceVersion': '',
        'selfLink': '',
        'spec': {},
        'status': {},
        'uid': 'types.UID'
    }
    kwargs = {
        'body': body,
        'kind': 'namespaces',
        'name': name,
    }
    return _replace(**kwargs)


def namespaces_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        resource_version=None,
        watch=False,
):
    """
    Watch a list of Namespace

    GET /api/v1beta3/watch/namespaces
    GET /api/v1beta3/watch/namespaces/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'namespaces',
        'label_selector': label_selector,
        'name': name,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def nodes_create():
    """
    Create a Node

    POST /api/v1beta3/nodes

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "spec": {
            "externalID": "",
            "podCIDR": "",
            "unschedulable": False
        },
        "status": {
            "addresses": [
                {
                    "address": "",
                    "type": ""
                }
            ],
            "capacity": "any",
            "conditions": [
                {
                    "lastHeartbeatTime": "",
                    "lastTransitionTime": "",
                    "message": "",
                    "reason": "",
                    "status": "",
                    "type": ""
                }
            ],
            "nodeInfo": {
                "KubeProxyVersion": "",
                "bootID": "",
                "containerRuntimeVersion": "",
                "kernelVersion": "",
                "kubeletVersion": "",
                "machineID": "",
                "osImage": "",
                "systemUUID": ""
            },
            "phase": ""
        },
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'nodes',
    }
    return _create(**kwargs)


def nodes_delete(
        name=None,
):
    """
    Delete a Node

    DELETE /api/v1beta3/nodes/{name}

    :return:
    """
    kwargs = {
        'kind': 'nodes',
        'name': name,
    }
    return _delete(**kwargs)


def nodes_list(
        field_selector=None,
        label_selector=None,
        name=None,
        resource_version=None,
        watch=False,
):
    """
    list of watch objects of kind Node

    GET  /api/v1beta3/nodes
    GET /api/v1beta3/nodes/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'nodes',
        'label_selector': label_selector,
        'name': name,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def nodes_patch(
        body='',
        name=None,
):
    """
    partially update the specified Node

    PATCH /api/v1beta3/nodes/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'nodes',
        'name': name,
    }
    return _patch(**kwargs)


def nodes_proxy_create(
        name=None,
        path=None,
):
    """
    proxy POST requests to Node

    POST /api/v1beta3/proxy/nodes/{name}
    POST /api/v1beta3/proxy/nodes/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'nodes',
        'name': name,
        'path': path,
        'proxy': True,
    }
    return _create(**kwargs)


def nodes_proxy_delete(
        name=None,
        path=None,
):
    """
    Proxy DELETE requests to Node

    DELETE /api/v1beta3/proxy/nodes/{name}
    DELETE /api/v1beta3/proxy/nodes/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'nodes',
        'name': name,
        'path': path,
        'proxy': True,
    }
    return _delete(**kwargs)


def nodes_proxy_list(
        name=None,
        path=None,
):
    """
    Proxy GET requests to Node

    GET /api/v1beta3/proxy/nodes/{name}
    GET /api/v1beta3/proxy/nodes/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'nodes',
        'name': name,
        'path': path,
        'proxy': True,
    }
    return _list(**kwargs)


def nodes_proxy_replace(
        name=None,
        path=None,
):
    """
    Proxy PUT requests to Node

    PUT /api/v1beta3/proxy/nodes/{name}
    PUT /api/v1beta3/proxy/nodes/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'nodes',
        'name': name,
        'path': path,
        'proxy': True,
    }
    return _replace(**kwargs)


def nodes_redirect(
        name=None,
):
    """
    Redirect GET request to Minion

    GET /api/v1beta3/redirect/nodes/{name}

    :return:
    """
    kwargs = {
        'kind': 'nodes',
        'name': name,
    }
    return _redirect(**kwargs)


def nodes_replace(
        name=None,
):
    """
    replace the specified Node

    PUT /api/v1beta3/nodes/{name}

    :return:
    """
    body = {
        'annotations': 'v1beta3.ObjectMeta.annotations',
        'apiVersion': '',
        'creationTimestamp': '',
        'generateName': '',
        'kind': '',
        'labels': 'v1beta3.ObjectMeta.labels',
        'name': '',
        'namespace': '',
        'resourceVersion': '',
        'selfLink': '',
        'spec': {
            'capacity': 'v1beta3.ResourceList',
            'cidr': ''
        },
        'status': {
            'conditions': [
                None
            ],
            'hostIP': '',
            'phase': 'v1beta3.NodePhase'
        },
        'uid': 'types.UID'
    }
    kwargs = {
        'body': body,
        'kind': 'nodes',
        'name': name,
    }
    return _replace(**kwargs)


def nodes_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        resource_version=None,
        watch=False,
):
    """
    Watch a list of Node

    GET /api/v1beta3/watch/nodes
    GET /api/v1beta3/watch/nodes/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'nodes',
        'label_selector': label_selector,
        'name': name,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def persistentvolumeclaims_create(
        namespaces=None,
):
    """

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "spec": {
            "accessModes": [
                {}
            ],
            "resources": {
                "limits": "any",
                "requests": "any"
            }
        },
        "status": {
            "accessModes": [
                {}
            ],
            "capacity": "any",
            "phase": "",
            "volumeRef": {
                "apiVersion": "",
                "fieldPath": "",
                "kind": "",
                "name": "",
                "namespace": "",
                "resourceVersion": "",
                "uid": ""
            }
        },
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'persistentvolumeclaims',
        'namespaces': namespaces,
    }
    return _create(**kwargs)


def persistentvolumeclaims_delete():
    """

    :return:
    """
    raise NotImplementedError


def persistentvolumeclaims_list(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'persistentvolumeclaims',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def persistentvolumeclaims_patch(
        body='',
        name=None,
        namespaces=None,
):
    """
    partially update the specified PersistentVolumeClaim

    PATCH /api/v1beta3/namespaces/{namespaces}/persistentvolumeclaims/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'persistentvolumeclaims',
        'name': name,
        'namespaces': namespaces,
    }
    return _patch(**kwargs)


def persistentvolumeclaims_replace():
    """

    :return:
    """
    raise NotImplementedError


def persistentvolumeclaims_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'persistentvolumeclaims',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def persistentvolumes_create():
    """

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "spec": {
            "accessModes": [
                {}
            ],
            "capacity": "any",
            "claimRef": {
                "apiVersion": "",
                "fieldPath": "",
                "kind": "",
                "name": "",
                "namespace": "",
                "resourceVersion": "",
                "uid": ""
            },
            "gcePersistentDisk": {
                "fsType": "",
                "partition": 0,
                "pdName": "",
                "readOnly": False
            },
            "glusterfs": {
                "endpoints": "",
                "path": "",
                "readOnly": False
            },
            "hostPath": {
                "path": ""
            }
        },
        "status": {
            "phase": ""
        },
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'persistentvolumes',
    }
    return _create(**kwargs)


def persistentvolumes_delete():
    """

    :return:
    """
    raise NotImplementedError


def persistentvolumes_list(
        field_selector=None,
        label_selector=None,
        name=None,
        resource_version=None,
        watch=False,
):
    """

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'persistentvolumes',
        'label_selector': label_selector,
        'name': name,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def persistentvolumes_patch(
        body='',
        name=None,
):
    """
    partially update the specified PersistentVolume

    PATCH /api/v1beta3/persistentvolumes/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'persistentvolumes',
        'name': name,
    }
    return _patch(**kwargs)


def persistentvolumes_replace():
    """

    :return:
    """
    raise NotImplementedError


def persistentvolumes_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        resource_version=None,
        watch=False,
):
    """

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'persistentvolumes',
        'label_selector': label_selector,
        'name': name,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def pods_create(
        namespaces=None,
):
    """
    Create a Pod

    POST /api/v1beta3/namespaces/{namespaces}/pods

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "spec": {
            "containers": [
                {
                    "args": [
                        ""
                    ],
                    "capabilities": {
                        "add": [
                            {}
                        ],
                        "drop": [
                            {}
                        ]
                    },
                    "command": [
                        ""
                    ],
                    "env": [
                        {
                            "name": "",
                            "value": ""
                        }
                    ],
                    "image": "",
                    "imagePullPolicy": "",
                    "lifecycle": {
                        "postStart": {
                            "exec": {
                                "command": [
                                    ""
                                ]
                            },
                            "httpGet": {
                                "host": "",
                                "path": "",
                                "port": ""
                            },
                            "tcpSocket": {
                                "port": ""
                            }
                        },
                        "preStop": {
                            "exec": {
                                "command": [
                                    ""
                                ]
                            },
                            "httpGet": {
                                "host": "",
                                "path": "",
                                "port": ""
                            },
                            "tcpSocket": {
                                "port": ""
                            }
                        }
                    },
                    "livenessProbe": {
                        "exec": {
                            "command": [
                                ""
                            ]
                        },
                        "httpGet": {
                            "host": "",
                            "path": "",
                            "port": ""
                        },
                        "initialDelaySeconds": 0,
                        "tcpSocket": {
                            "port": ""
                        },
                        "timeoutSeconds": 0
                    },
                    "name": "",
                    "ports": [
                        {
                            "containerPort": 0,
                            "hostIP": "",
                            "hostPort": 0,
                            "name": "",
                            "protocol": ""
                        }
                    ],
                    "privileged": False,
                    "readinessProbe": {
                        "exec": {
                            "command": [
                                ""
                            ]
                        },
                        "httpGet": {
                            "host": "",
                            "path": "",
                            "port": ""
                        },
                        "initialDelaySeconds": 0,
                        "tcpSocket": {
                            "port": ""
                        },
                        "timeoutSeconds": 0
                    },
                    "resources": {
                        "limits": "any",
                        "requests": "any"
                    },
                    "terminationMessagePath": "",
                    "volumeMounts": [
                        {
                            "mountPath": "",
                            "name": "",
                            "readOnly": False
                        }
                    ],
                    "workingDir": ""
                }
            ],
            "dnsPolicy": "",
            "host": "",
            "hostNetwork": False,
            "nodeSelector": "any",
            "restartPolicy": "",
            "volumes": [
                {
                    "emptyDir": {
                        "medium": ""
                    },
                    "gcePersistentDisk": {
                        "fsType": "",
                        "partition": 0,
                        "pdName": "",
                        "readOnly": False
                    },
                    "gitRepo": {
                        "repository": "",
                        "revision": ""
                    },
                    "glusterfs": {
                        "endpoints": "",
                        "path": "",
                        "readOnly": False
                    },
                    "hostPath": {
                        "path": ""
                    },
                    "iscsi": {
                        "fsType": "",
                        "iqn": "",
                        "lun": 0,
                        "readOnly": False,
                        "targetPortal": ""
                    },
                    "name": "",
                    "nfs": {
                        "path": "",
                        "readOnly": False,
                        "server": ""
                    },
                    "secret": {
                        "secretName": ""
                    }
                }
            ]
        },
        "status": {
            "Condition": [
                {
                    "status": "",
                    "type": ""
                }
            ],
            "containerStatuses": [
                {
                    "containerID": "",
                    "image": "",
                    "imageID": "",
                    "lastState": {
                        "running": {
                            "startedAt": ""
                        },
                        "termination": {
                            "containerID": "",
                            "exitCode": 0,
                            "finishedAt": "",
                            "message": "",
                            "reason": "",
                            "signal": 0,
                            "startedAt": ""
                        },
                        "waiting": {
                            "reason": ""
                        }
                    },
                    "name": "",
                    "ready": False,
                    "restartCount": 0,
                    "state": {
                        "running": {
                            "startedAt": ""
                        },
                        "termination": {
                            "containerID": "",
                            "exitCode": 0,
                            "finishedAt": "",
                            "message": "",
                            "reason": "",
                            "signal": 0,
                            "startedAt": ""
                        },
                        "waiting": {
                            "reason": ""
                        }
                    }
                }
            ],
            "hostIP": "",
            "message": "",
            "phase": "",
            "podIP": ""
        },
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'pods',
        'namespaces': namespaces,
    }
    return _create(**kwargs)


def pods_delete(
        name=None,
        namespaces=None,
):
    """
    Delete a Pod

    DELETE /api/v1beta3/namespaces/{namespaces}/pods/{name}

    :return:
    """
    kwargs = {
        'kind': 'pods',
        'name': name,
        'namespaces': namespaces,
    }
    return _delete(**kwargs)


def pods_list(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    list of watch objects of kind Pod

    GET /api/v1beta3/pods
    GET /api/v1beta3/namespaces/{namespaces}/pods
    GET /api/v1beta3/namespaces/{namespaces}/pods/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'pods',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def pods_patch(
        body='',
        name=None,
        namespaces=None,
):
    """
    partially update the specified Pod

    PATCH /api/v1beta3/namespaces/{namespaces}/pods/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'pods',
        'name': name,
        'namespaces': namespaces,
    }
    return _patch(**kwargs)


def pods_proxy_create(
        name=None,
        namespaces=None,
        path=None,
):
    """
    proxy POST requests to Pod

    POST /api/v1beta3/proxy/namespaces/{namespaces}/pods/{name}
    POST /api/v1beta3/proxy/namespaces/{namespaces}/pods/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'pods',
        'name': name,
        'namespaces': namespaces,
        'path': path,
        'proxy': True,
    }
    return _create(**kwargs)


def pods_proxy_delete(
        name=None,
        namespaces=None,
        path=None,
):
    """
    Proxy DELETE requests to Pod

    DELETE /api/v1beta3/proxy/namespaces/{namespaces}/pods/{name}
    DELETE /api/v1beta3/proxy/namespaces/{namespaces}/pods/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'pods',
        'name': name,
        'namespaces': namespaces,
        'path': path,
        'proxy': True,
    }
    return _delete(**kwargs)


def pods_proxy_list(
        name=None,
        namespaces=None,
        path=None,
):
    """
    Proxy GET requests to Pod

    GET /api/v1beta3/proxy/namespaces/{namespaces}/pods/{name}
    GET /api/v1beta3/proxy/namespaces/{namespaces}/pods/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'pods',
        'name': name,
        'namespaces': namespaces,
        'path': path,
        'proxy': True,
    }
    return _list(**kwargs)


def pods_proxy_replace(
        name=None,
        namespaces=None,
        path=None,
):
    """
    Proxy PUT requests to Pod

    PUT /api/v1beta3/proxy/namespaces/{namespaces}/pods/{name}
    PUT /api/v1beta3/proxy/namespaces/{namespaces}/pods/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'pods',
        'name': name,
        'namespaces': namespaces,
        'path': path,
        'proxy': True,
    }
    return _replace(**kwargs)


def pods_redirect(
        name=None,
        namespaces=None,
):
    """
    Redirect GET request to Pod

    GET /api/v1beta3/redirect/namespaces/{namespaces}/pods/{name}

    :return:
    """
    kwargs = {
        'kind': 'pods',
        'name': name,
        'namespaces': namespaces,
    }
    return _redirect(**kwargs)


def pods_replace(
        name=None,
        namespaces=None,
):
    """
    replace the specified Pod

    PUT /api/v1beta3/namespaces/{namespaces}/pods/{name}

    :return:
    """
    body = {
        'annotations': 'v1beta3.ObjectMeta.annotations',
        'apiVersion': '',
        'creationTimestamp': '',
        'generateName': '',
        'kind': '',
        'labels': 'v1beta3.ObjectMeta.labels',
        'name': '',
        'namespace': '',
        'resourceVersion': '',
        'selfLink': '',
        'spec': {
            'containers': [
                None
            ],
            'dnsPolicy': 'v1beta3.DNSPolicy',
            'host': '',
            'nodeSelector': {},
            'restartPolicy': {
                'always': {},
                'never': {},
                'onFailure': {}
            },
            'volumes': [
                None
            ]
        },
        'status': {
            'Condition': [
                None
            ],
            'host': '',
            'hostIP': '',
            'info': 'v1beta3.PodInfo',
            'message': '',
            'phase': 'v1beta3.PodPhase',
            'podIP': ''
        },
        'uid': 'types.UID'
    }
    kwargs = {
        'body': body,
        'kind': 'pods',
        'name': name,
        'namespaces': namespaces,
    }
    return _replace(**kwargs)


def pods_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    Watch a list of Pod

    GET /api/v1beta3/watch/pods
    GET /api/v1beta3/watch/namespaces/{namespaces}/pods
    GET /api/v1beta3/watch/namespaces/{namespaces}/pods/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'pods',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def replicationcontrollers_create(
        namespaces=None,
):
    """
    Create a ReplicationController

    POST /api/v1beta3/namespaces/{namespaces}/replicationcontrollers

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "spec": {
            "replicas": 0,
            "selector": "any",
            "template": {
                "annotations": "any",
                "creationTimestamp": "",
                "deletionTimestamp": "",
                "generateName": "",
                "labels": "any",
                "name": "",
                "namespace": "",
                "resourceVersion": "",
                "selfLink": "",
                "spec": {
                    "containers": [
                        {
                            "args": [
                                ""
                            ],
                            "capabilities": {
                                "add": [
                                    {}
                                ],
                                "drop": [
                                    {}
                                ]
                            },
                            "command": [
                                ""
                            ],
                            "env": [
                                {
                                    "name": "",
                                    "value": ""
                                }
                            ],
                            "image": "",
                            "imagePullPolicy": "",
                            "lifecycle": {
                                "postStart": {
                                    "exec": {
                                        "command": [
                                            ""
                                        ]
                                    },
                                    "httpGet": {
                                        "host": "",
                                        "path": "",
                                        "port": ""
                                    },
                                    "tcpSocket": {
                                        "port": ""
                                    }
                                },
                                "preStop": {
                                    "exec": {
                                        "command": [
                                            ""
                                        ]
                                    },
                                    "httpGet": {
                                        "host": "",
                                        "path": "",
                                        "port": ""
                                    },
                                    "tcpSocket": {
                                        "port": ""
                                    }
                                }
                            },
                            "livenessProbe": {
                                "exec": {
                                    "command": [
                                        ""
                                    ]
                                },
                                "httpGet": {
                                    "host": "",
                                    "path": "",
                                    "port": ""
                                },
                                "initialDelaySeconds": 0,
                                "tcpSocket": {
                                    "port": ""
                                },
                                "timeoutSeconds": 0
                            },
                            "name": "",
                            "ports": [
                                {
                                    "containerPort": 0,
                                    "hostIP": "",
                                    "hostPort": 0,
                                    "name": "",
                                    "protocol": ""
                                }
                            ],
                            "privileged": False,
                            "readinessProbe": {
                                "exec": {
                                    "command": [
                                        ""
                                    ]
                                },
                                "httpGet": {
                                    "host": "",
                                    "path": "",
                                    "port": ""
                                },
                                "initialDelaySeconds": 0,
                                "tcpSocket": {
                                    "port": ""
                                },
                                "timeoutSeconds": 0
                            },
                            "resources": {
                                "limits": "any",
                                "requests": "any"
                            },
                            "terminationMessagePath": "",
                            "volumeMounts": [
                                {
                                    "mountPath": "",
                                    "name": "",
                                    "readOnly": False
                                }
                            ],
                            "workingDir": ""
                        }
                    ],
                    "dnsPolicy": "",
                    "host": "",
                    "hostNetwork": False,
                    "nodeSelector": "any",
                    "restartPolicy": "",
                    "volumes": [
                        {
                            "emptyDir": {
                                "medium": ""
                            },
                            "gcePersistentDisk": {
                                "fsType": "",
                                "partition": 0,
                                "pdName": "",
                                "readOnly": False
                            },
                            "gitRepo": {
                                "repository": "",
                                "revision": ""
                            },
                            "glusterfs": {
                                "endpoints": "",
                                "path": "",
                                "readOnly": False
                            },
                            "hostPath": {
                                "path": ""
                            },
                            "iscsi": {
                                "fsType": "",
                                "iqn": "",
                                "lun": 0,
                                "readOnly": False,
                                "targetPortal": ""
                            },
                            "name": "",
                            "nfs": {
                                "path": "",
                                "readOnly": False,
                                "server": ""
                            },
                            "secret": {
                                "secretName": ""
                            }
                        }
                    ]
                },
                "uid": ""
            },
            "templateRef": {
                "apiVersion": "",
                "fieldPath": "",
                "kind": "",
                "name": "",
                "namespace": "",
                "resourceVersion": "",
                "uid": ""
            }
        },
        "status": {
            "replicas": 0
        },
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'replicationcontrollers',
        'namespaces': namespaces,
    }
    return _create(**kwargs)


def replicationcontrollers_delete(
        name=None,
        namespaces=None,
):
    """
    Delete a ReplicationController

    DELETE /api/v1beta3/namespaces/{namespaces}/replicationcontrollers/{name}

    :return:
    """
    kwargs = {
        'kind': 'replicationcontrollers',
        'name': name,
        'namespaces': namespaces,
    }
    return _delete(**kwargs)


def replicationcontrollers_list(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    list of watch objects of kind ReplicationController

    GET /api/v1beta3/replicationcontrollers
    GET /api/v1beta3/namespaces/{namespaces}/replicationcontrollers
    GET /api/v1beta3/namespaces/{namespaces}/replicationcontrollers/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'replicationcontrollers',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def replicationcontrollers_patch(
        body='',
        name=None,
        namespaces=None,
):
    """
    partially update the specified ReplicationController

    PATCH /api/v1beta3/namespaces/{namespaces}/replicationcontrollers/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'replicationcontrollers',
        'name': name,
        'namespaces': namespaces,
    }
    return _patch(**kwargs)


def replicationcontrollers_replace(
        name=None,
        namespaces=None,
):
    """
    replace the specified ReplicationController

    PUT /api/v1beta3/namespaces/{namespaces}/replicationcontrollers/{name}

    :return:
    """
    body = {
        'annotations': 'v1beta3.ObjectMeta.annotations',
        'apiVersion': '',
        'creationTimestamp': '',
        'generateName': '',
        'kind': '',
        'labels': 'v1beta3.ObjectMeta.labels',
        'name': '',
        'namespace': '',
        'resourceVersion': '',
        'selfLink': '',
        'spec': {
            'replicas': 0,
            'selector': {},
            'template': {
                'annotations': 'v1beta3.ObjectMeta.annotations',
                'creationTimestamp': '',
                'generateName': '',
                'labels': 'v1beta3.ObjectMeta.labels',
                'name': '',
                'namespace': '',
                'resourceVersion': '',
                'selfLink': '',
                'spec': {
                    'containers': [
                        None
                    ],
                    'dnsPolicy': 'v1beta3.DNSPolicy',
                    'host': '',
                    'nodeSelector': {},
                    'restartPolicy': {
                        'always': {},
                        'never': {},
                        'onFailure': {}
                    },
                    'volumes': [
                        None
                    ]
                },
                'uid': 'types.UID'
            },
            'templateRef': {
                'apiVersion': '',
                'fieldPath': '',
                'kind': '',
                'name': '',
                'namespace': '',
                'resourceVersion': '',
                'uid': 'types.UID'
            }
        },
        'status': {
            'replicas': 0
        },
        'uid': 'types.UID'
    }
    kwargs = {
        'body': body,
        'kind': 'replicationcontrollers',
        'name': name,
        'namespaces': namespaces,
    }
    return _replace(**kwargs)


def replicationcontrollers_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    Watch a list of ReplicationController

    GET /api/v1beta3/watch/replicationcontrollers
    GET /api/v1beta3/watch/namespaces/{namespaces}/replicationcontrollers
    GET /api/v1beta3/watch/namespaces/{namespaces}/replicationcontrollers/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'replicationcontrollers',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def resourcesquotas_create(
        namespaces=None,
):
    """
    Create a ResourceQuota

    POST /api/v1beta3/namespaces/{namespaces}/resourcequotas

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "spec": {
            "hard": "any"
        },
        "status": {
            "hard": "any",
            "used": "any"
        },
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'resourcequotas',
        'namespaces': namespaces,
    }
    return _create(**kwargs)


def resourcesquotas_delete(
        name=None,
        namespaces=None,
):
    """
    Delete a ResourceQuota

    DELETE /api/v1beta3/namespaces/{namespaces}/resourcequotas/{name}

    :return:
    """
    kwargs = {
        'kind': 'resourcequotas',
        'name': name,
        'namespaces': namespaces,
    }
    return _delete(**kwargs)


def resourcesquotas_list(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    list of watch objects of kind ResourceQuota

    GET /api/v1beta3/resourcequotas
    GET /api/v1beta3/namespaces/{namespaces}/resourcequotas
    GET /api/v1beta3/namespaces/{namespaces}/resourcequotas/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'resourcequotas',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def resourcesquotas_patch(
        body='',
        name=None,
        namespaces=None,
):
    """
    partially update the specified ResourceQuota

    PATCH /api/v1beta3/namespaces/{namespaces}/resourcesquotas/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'resourcesquotas',
        'name': name,
        'namespaces': namespaces,
    }
    return _patch(**kwargs)


def resourcesquotas_replace(
        name=None,
        namespaces=None,
):
    """
    replace the specified ResourceQuota

    PUT /api/v1beta3/namespaces/{namespaces}/resourcequotas/{name}

    :return:
    """
    body = {
        'annotations': 'v1beta3.ObjectMeta.annotations',
        'apiVersion': '',
        'creationTimestamp': '',
        'generateName': '',
        'kind': '',
        'labels': 'v1beta3.ObjectMeta.labels',
        'name': '',
        'namespace': '',
        'resourceVersion': '',
        'selfLink': '',
        'spec': {
            'hard': 'v1beta3.ResourceList'
        },
        'status': {
            'hard': 'v1beta3.ResourceList',
            'used': 'v1beta3.ResourceList'
        },
        'uid': 'types.UID'
    }
    kwargs = {
        'body': body,
        'kind': 'resourcequotas',
        'name': name,
        'namespaces': namespaces,
    }
    return _replace(**kwargs)


def resourcesquotas_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    Watch a list of ResourceQuota

    GET /api/v1beta3/watch/resourcequotas
    GET /api/v1beta3/watch/namespaces/{namespaces}/resourcequotas
    GET /api/v1beta3/watch/namespaces/{namespaces}/resourcequotas/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'resourcequotas',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def resourcesquotausages_create(
        namespaces=None,
):
    """
    Create a ResourceQuotaUsage

    POST /api/v1beta3/namespaces/{namespaces}/resourcequotausages

    :return:
    """
    body = {
        'annotations': 'v1beta3.ObjectMeta.annotations',
        'apiVersion': '',
        'creationTimestamp': '',
        'generateName': '',
        'kind': '',
        'labels': 'v1beta3.ObjectMeta.labels',
        'name': '',
        'namespace': '',
        'resourceVersion': '',
        'selfLink': '',
        'status': {
            'hard': 'v1beta3.ResourceList',
            'used': 'v1beta3.ResourceList'
        },
        'uid': 'types.UID'
    }
    kwargs = {
        'body': body,
        'kind': 'resourcequotausages',
        'namespaces': namespaces,
    }
    return _create(**kwargs)


def secrets_create(
        namespaces=None,
):
    """
    Create a Secret

    POST /api/v1beta3/namespaces/{namespaces}/secrets

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "data": "any",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "type": "",
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'secrets',
        'namespaces': namespaces,
    }
    return _create(**kwargs)


def secrets_delete(
        name=None,
        namespaces=None,
):
    """
    Delete a Secret

    DELETE /api/v1beta3/namespaces/{namespaces}/secrets/{name}

    :return:
    """
    kwargs = {
        'kind': 'secrets',
        'name': name,
        'namespaces': namespaces,
    }
    return _delete(**kwargs)


def secrets_list(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    list of watch objects of kind Secret

    GET /api/v1beta3/secrets
    GET /api/v1beta3/namespaces/{namespaces}/secrets
    GET /api/v1beta3/namespaces/{namespaces}/secrets/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'secrets',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def secrets_patch(
        body='',
        name=None,
        namespaces=None,
):
    """
    partially update the specified Secret

    PATCH /api/v1beta3/namespaces/{namespaces}/secrets/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'secrets',
        'name': name,
        'namespaces': namespaces,
    }
    return _patch(**kwargs)


def secrets_replace(
        name=None,
        namespaces=None,
):
    """
    replace the specified Secret

    PUT /api/v1beta3/namespaces/{namespaces}/secrets/{name}

    :return:
    """
    body = {
        'annotations': 'v1beta3.ObjectMeta.annotations',
        'apiVersion': '',
        'creationTimestamp': '',
        'data': {},
        'generateName': '',
        'kind': '',
        'labels': 'v1beta3.ObjectMeta.labels',
        'name': '',
        'namespace': '',
        'resourceVersion': '',
        'selfLink': '',
        'type': 'v1beta3.SecretType',
        'uid': 'types.UID'
    }
    kwargs = {
        'body': body,
        'kind': 'secrets',
        'name': name,
        'namespaces': namespaces,
    }
    return _replace(**kwargs)


def secrets_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    Watch a list of Secret

    GET /api/v1beta3/watch/secrets
    GET /api/v1beta3/watch/namespaces/{namespaces}/secrets
    GET /api/v1beta3/watch/namespaces/{namespaces}/secrets/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'secrets',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def services_create(
        namespaces=None,
):
    """
    Create a Service

    POST /api/v1beta3/namespaces/{namespaces}/services

    :return:
    """
    body = {
        "annotations": "any",
        "apiVersion": "",
        "creationTimestamp": "",
        "deletionTimestamp": "",
        "generateName": "",
        "kind": "",
        "labels": "any",
        "name": "",
        "namespace": "",
        "resourceVersion": "",
        "selfLink": "",
        "spec": {
            "createExternalLoadBalancer": False,
            "portalIP": "",
            "ports": [
                {
                    "name": "",
                    "port": 0,
                    "protocol": "",
                    "targetPort": ""
                }
            ],
            "publicIPs": [
                ""
            ],
            "selector": "any",
            "sessionAffinity": ""
        },
        "status": {},
        "uid": ""
    }
    kwargs = {
        'body': body,
        'kind': 'services',
        'namespaces': namespaces,
    }
    return _create(**kwargs)


def services_delete(
        name=None,
        namespaces=None,
):
    """
    Delete a Service

    DELETE /api/v1beta3/namespaces/{namespaces}/services/{name}

    :return:
    """
    kwargs = {
        'kind': 'services',
        'name': name,
        'namespaces': namespaces,
    }
    return _delete(**kwargs)


def services_list(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    list of watch objects of kind Service

    GET /api/v1beta3/services
    GET /api/v1beta3/namespaces/{namespaces}/services
    GET /api/v1beta3/namespaces/{namespaces}/services/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'services',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _list(**kwargs)


def services_patch(
        body='',
        name=None,
        namespaces=None,
):
    """
    partially update the specified Service

    PATCH /api/v1beta3/namespaces/{namespaces}/services/{name}

    :return:
    """
    kwargs = {
        'body': body,
        'kind': 'services',
        'name': name,
        'namespaces': namespaces,
    }
    return _patch(**kwargs)


def services_proxy_create(
        name=None,
        namespaces=None,
        path=None,
):
    """
    proxy POST requests to Service

    POST /api/v1beta3/proxy/namespaces/{namespaces}/services/{name}
    POST /api/v1beta3/proxy/namespaces/{namespaces}/services/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'services',
        'name': name,
        'namespaces': namespaces,
        'path': path,
        'proxy': True,
    }
    return _create(**kwargs)


def services_proxy_delete(
        name=None,
        namespaces=None,
        path=None,
):
    """
    Proxy DELETE requests to Service

    DELETE /api/v1beta3/proxy/namespaces/{namespaces}/services/{name}
    DELETE /api/v1beta3/proxy/namespaces/{namespaces}/services/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'services',
        'name': name,
        'namespaces': namespaces,
        'path': path,
        'proxy': True,
    }
    return _delete(**kwargs)


def services_proxy_list(
        name=None,
        namespaces=None,
        path=None,
):
    """
    Proxy GET requests to Service

    GET /api/v1beta3/proxy/namespaces/{namespaces}/services/{name}
    GET /api/v1beta3/proxy/namespaces/{namespaces}/services/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'services',
        'name': name,
        'namespaces': namespaces,
        'path': path,
        'proxy': True,
    }
    return _list(**kwargs)


def services_proxy_replace(
        name=None,
        namespaces=None,
        path=None,
):
    """
    Proxy PUT requests to Service

    PUT /api/v1beta3/proxy/namespaces/{namespaces}/services/{name}
    PUT /api/v1beta3/proxy/namespaces/{namespaces}/services/{name}/{path:*}

    :return:
    """
    kwargs = {
        'kind': 'services',
        'name': name,
        'namespaces': namespaces,
        'path': path,
        'proxy': True,
    }
    return _replace(**kwargs)


def services_redirect(
        name=None,
        namespaces=None,
):
    """
    Redirect GET request to Service

    GET /api/v1beta3/redirect/namespaces/{namespaces}/services/{name}

    :return:
    """
    kwargs = {
        'kind': 'services',
        'name': name,
        'namespaces': namespaces,
    }
    return _redirect(**kwargs)


def services_replace(
        name=None,
        namespaces=None,
):
    """
    replace the specified Service

    PUT /api/v1beta3/namespaces/{namespaces}/services/{name}

    :return:
    """
    body = {
        'annotations': 'v1beta3.ObjectMeta.annotations',
        'apiVersion': '',
        'creationTimestamp': '',
        'generateName': '',
        'kind': '',
        'labels': 'v1beta3.ObjectMeta.labels',
        'name': '',
        'namespace': '',
        'resourceVersion': '',
        'selfLink': '',
        'spec': {
            'containerPort': '',
            'createExternalLoadBalancer': False,
            'port': 0,
            'portalIP': '',
            'protocol': 'v1beta3.Protocol',
            'publicIPs': [
                None
            ],
            'selector': {},
            'sessionAffinity': 'v1beta3.AffinityType'
        },
        'status': {},
        'uid': 'types.UID'
    }
    kwargs = {
        'body': body,
        'kind': 'services',
        'name': name,
        'namespaces': namespaces,
    }
    return _replace(**kwargs)


def services_watch(
        field_selector=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """
    Watch a list of Service

    GET /api/v1beta3/watch/services
    GET /api/v1beta3/watch/namespaces/{namespaces}/services
    GET /api/v1beta3/watch/namespaces/{namespaces}/services/{name}

    :return:
    """
    kwargs = {
        'field_selector': field_selector,
        'kind': 'services',
        'label_selector': label_selector,
        'name': name,
        'namespaces': namespaces,
        'resource_version': resource_version,
        'watch': watch,
    }
    return _watch(**kwargs)


def version():
    """
    Get the code version

    GET /version

    :return:
    """
    args = [
        '/version'
    ]
    kwargs = {
        'method': 'GET'
    }
    return query(*args, **kwargs)


def _create(
        body=None,
        kind=None,
        name=None,
        namespaces=None,
        path=None,
        proxy=False,
):
    """

    :return:
    """
    version_ = version()
    url = '/api/{0}'.format(version_)
    if proxy:
        url += '/proxy'
    if (version_ not in ['v1beta1', 'v1beta2'] and
                kind not in ['namespaces', 'nodes', 'persistentvolumes']):
        if namespaces:
            url += '/namespaces/{0}'.format(namespaces)
        else:
            return None
    url += '/{0}'.format(kind)
    if name:
        url += '/{0}'.format(name)
    if path:
        url += '/{0}'.format(path)
    args = [
        url
    ]
    kwargs = {
        'method': 'POST'
    }
    if body is not None:
        kwargs['data'] = loads(body)
    return query(*args, **kwargs)


def _delete(
        kind=None,
        name=None,
        namespaces=None,
        path=None,
        proxy=False,
):
    """

    :return:
    """
    version_ = version()
    url = '/api/{0}'.format(version_)
    if proxy:
        url += '/proxy'
    if (version_ not in ['v1beta1', 'v1beta2'] and
                kind not in ['namespaces', 'nodes', 'persistentvolumes']):
        if namespaces:
            url += '/namespaces/{0}'.format(namespaces)
        else:
            return None
    url += '/{0}'.format(kind)
    if name:
        url += '/{0}'.format(name)
    else:
        return None
    if path:
        url += '/{0}'.format(path)
    args = [
        url
    ]
    kwargs = {
        'method': 'DELETE'
    }
    return query(*args, **kwargs)


def _list(
        field_selector=None,
        kind=None,
        label_selector=None,
        name=None,
        namespaces=None,
        path=None,
        proxy=False,
        resource_version=None,
        watch=False,
):
    """

    :return:
    """
    version_ = version()
    url = '/api/{0}'.format(version_)
    if proxy:
        url += '/proxy'
    if (version_ not in ['v1beta1', 'v1beta2'] and
                kind not in ['namespaces', 'nodes', 'persistentvolumeclaims', 'persistentvolumes']):
        if namespaces:
            url += '/namespaces/{0}'.format(namespaces)
        else:
            return None
    url += '/{0}'.format(kind)
    if name:
        url += '/{0}'.format(name)
    if path:
        url += '/{0}'.format(path)
    args = [
        url
    ]
    kwargs = {
        'method': 'GET'
    }
    params = {}
    if field_selector is not None:
        params.update({
            'fieldSelector': field_selector,
        })
    if label_selector is not None:
        params.update({
            'labelSelector': label_selector,
        })
    if resource_version is not None:
        params.update({
            'resourceVersion': resource_version,
        })
    if watch is not False:
        params.update({
            'watch': watch,
        })
    if params:
        kwargs.update(params)
    return query(*args, **kwargs)


def _redirect(
        kind=None,
        name=None,
        namespaces=None,
):
    """

    :return:
    """
    version_ = version()
    url = '/api/{0}/redirect'.format(version_)
    if (version_ not in ['v1beta1', 'v1beta2'] and
                kind not in ['namespaces', 'nodes', 'persistentvolumes']):
        if namespaces:
            url += '/namespaces/{0}'.format(namespaces)
        else:
            return None
    url += '/{0}'.format(kind)
    if name:
        url += '/{0}'.format(name)
    else:
        return None
    args = [
        url
    ]
    kwargs = {
        'method': 'GET'
    }
    return query(*args, **kwargs)


def _patch(
        kind=None,
        name=None,
        namespaces=None,
):
    """

    :return:
    """
    version_ = version()
    url = '/api/{0}'.format(version_)
    if (version_ not in ['v1beta1', 'v1beta2'] and
                kind not in ['namespaces', 'nodes', 'persistentvolumes']):
        if namespaces:
            url += '/namespaces/{0}'.format(namespaces)
        else:
            return None
    url += '/{0}'.format(kind)
    if name:
        url += '/{0}'.format(name)
    args = [
        url
    ]
    kwargs = {
        'method': 'PATCH'
    }
    return query(*args, **kwargs)


def _replace(
        kind=None,
        name=None,
        namespaces=None,
        path=None,
        proxy=False,
):
    """

    :return:
    """
    version_ = version()
    url = '/api/{0}'.format(version_)
    if proxy:
        url += '/proxy'
    if (version_ not in ['v1beta1', 'v1beta2'] and
                kind not in ['namespaces', 'nodes', 'persistentvolumes']):
        if namespaces:
            url += '/namespaces/{0}'.format(namespaces)
        else:
            return None
    url += '/{0}'.format(kind)
    if name:
        url += '/{0}'.format(name)
    else:
        return None
    if path:
        url += '/{0}'.format(path)
    args = [
        url
    ]
    kwargs = {
        'method': 'PUT'
    }
    return query(*args, **kwargs)


def _watch(
        field_selector=None,
        kind=None,
        label_selector=None,
        name=None,
        namespaces=None,
        resource_version=None,
        watch=False,
):
    """

    :return:
    """
    version_ = version()
    url = '/api/{0}'.format(version_)
    if version_ not in ['v1beta1', 'v1beta2']:
        if namespaces:
            url += '/namespaces/{0}'.format(namespaces)
        else:
            return None
    url += '/{0}'.format(kind)
    if name:
        url += '/{0}'.format(name)
    args = [
        url
    ]
    kwargs = {
        'method': 'GET'
    }
    params = {}
    if field_selector is not None:
        params.update({
            'fieldSelector': field_selector,
        })
    if label_selector is not None:
        params.update({
            'labelSelector': label_selector,
        })
    if resource_version is not None:
        params.update({
            'resourceVersion': resource_version,
        })
    if watch is not False:
        params.update({
            'watch': watch,
        })
    if params:
        kwargs.update(params)
    return query(*args, **kwargs)
