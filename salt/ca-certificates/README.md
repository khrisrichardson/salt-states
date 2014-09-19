# ca-certificates

## Description:

This package includes PEM files of CA certificates to allow SSL-based applications to check for the authenticity of SSL connections.

It includes, among others, certificate authorities used by the Debian infrastructure and those shipped with Mozilla's browsers.

Please note that Debian can neither confirm nor deny whether the certificate authorities whose certificates are included in this package have in any way been audited for trustworthiness or RFC 3647 compliance. Full responsibility to assess them belongs to the local system administrator.

## Depends:

  -  N/A

## Reverse Depends:

  -  [cadvisor](salt/cadvisor)
  -  [etcd](salt/etcd)
  -  [etcdctl](salt/etcdctl)
  -  [fleet](salt/fleet)
  -  [gomock](salt/gomock)
  -  [kubernetes](salt/kubernetes)
  -  [libswarm](salt/libswarm)
  -  [skydns2](salt/skydns2)

## Relates:

  -  N/A

## Files:

```bash
.
└── init.sls

0 directories, 1 file
```
