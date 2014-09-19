# python-openssl

## Description:

High-level wrapper around a subset of the OpenSSL library, includes

 * SSL.Connection objects, wrapping the methods of Python's portable
   sockets
 * Callbacks written in Python
 * Extensive error-handling mechanism, mirroring OpenSSL's error
   codes
A lot of the object methods do nothing more than calling a corresponding function in the OpenSSL library.

## Depends:

  -  N/A

## Reverse Depends:

  -  [kubernetes-apiserver](salt/kubernetes-apiserver)
  -  [python-etcd](salt/python-etcd)
  -  [salt-halite](salt/salt-halite)

## Relates:

  -  N/A

## Files:

```bash
.
└── init.sls

0 directories, 1 file
```
