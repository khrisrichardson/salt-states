# wget

## Description:

Wget is a network utility to retrieve files from the web using HTTP(S) and FTP, the two most widely used internet protocols. It works non-interactively, so it will work in the background, after having logged off. The program supports recursive retrieval of web-authoring pages as well as FTP sites -- you can use Wget to make mirrors of archives and home pages or to travel the web like a WWW robot.

Wget works particularly well with slow or unstable connections by continuing to retrieve a document until the document is fully downloaded. Re-getting files from where it left off works on servers (both HTTP and FTP) that support it. Both HTTP and FTP retrievals can be time stamped, so Wget can see if the remote file has changed since the last retrieval and automatically retrieve the new version if it has.

Wget supports proxy servers; this can lighten the network load, speed up retrieval, and provide access behind firewalls.

## Depends:

  -  N/A

## Reverse Depends:

  -  [etcd-common](/salt/etcd-common)
  -  [fleet-common](/salt/fleet-common)
  -  [grafana](/salt/grafana)
  -  [jenkins](/salt/jenkins)
  -  [kibana](/salt/kibana)
  -  [maven](/salt/maven)

## Relates:

  -  N/A

## Files:

```bash
.
└── init.sls

0 directories, 1 file
```
